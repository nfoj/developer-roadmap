#!/bin/bash
# Script aprimorado para coletar logs de containers Docker periodicamente.

# Intervalo entre verificações (em segundos)
CHECK_INTERVAL=60
# Diretório base para armazenar os logs (pode ser alterado)
BASE_LOG_DIR="/home/user/git/developer-roadmap/projects/log-archive-tool"

echo "Iniciando o script coletor de logs Docker..."
echo "Os logs serão armazenados em subdiretórios dentro de: $BASE_LOG_DIR"
echo "Intervalo de verificação: $CHECK_INTERVAL segundos."

# Garante que o diretório base de logs exista
mkdir -p "$BASE_LOG_DIR"
if [ ! -d "$BASE_LOG_DIR" ]; then
  echo "ERRO: Falha ao criar o diretório base de logs '$BASE_LOG_DIR'. Saindo."
  exit 1
fi
# Entra no diretório base para simplificar os caminhos
cd "$BASE_LOG_DIR" || exit 1

while true; do
    echo "-----------------------------------------------------"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Verificando containers Docker em execução..."

    # Obter IDs de containers em execução de forma eficiente
    # Usar mapfile (Bash 4+) para ler os IDs em um array.
    # Se precisar de compatibilidade com Bash mais antigo, use um loop while read.
    mapfile -t running_ids < <(docker ps -q --filter status=running)

    # Verificar se o array está vazio
    if [ ${#running_ids[@]} -eq 0 ]; then
        echo "Nenhum container Docker em execução encontrado."
    else
        echo "Encontrados ${#running_ids[@]} containers em execução. Processando logs..."

        processed_count=0
        failed_count=0
        for docker_id in "${running_ids[@]}"; do
            # Usar os primeiros 12 caracteres do ID para o nome do diretório/arquivo (padrão Docker)
            short_id=$(echo "$docker_id" | cut -c1-12)
            log_dir="$short_id"
            log_file="$log_dir/$short_id.log"
            # Arquivo para guardar o timestamp da última coleta bem-sucedida
            ts_file="$log_dir/$short_id.timestamp"

            # Garantir que o diretório de log do container exista
            if ! mkdir -p "$log_dir"; then
                echo "ERRO: Falha ao criar diretório '$log_dir' para container $short_id. Pulando."
                failed_count=$((failed_count + 1))
                continue # Pula para o próximo container
            fi

            # Determinar o valor para --since baseado no arquivo de timestamp
            since_param=""
            if [[ -f "$ts_file" ]]; then
                last_fetch_ts=$(cat "$ts_file")
                # Verifica se o timestamp lido não está vazio
                if [[ -n "$last_fetch_ts" ]]; then
                    # Usa o timestamp do arquivo como ponto de partida
                    # Docker espera formato RFC3339 ou Unix timestamp. ISO 8601 funciona bem.
                    since_param="--since $last_fetch_ts"
                    echo "  [Container $short_id] Coletando logs desde $last_fetch_ts"
                else
                    echo "  [Container $short_id] Arquivo timestamp '$ts_file' vazio. Coletando todos os logs."
                    # Se o arquivo estiver vazio, coleta tudo (não passa --since)
                fi
            else
                echo "  [Container $short_id] Nenhum timestamp anterior encontrado. Coletando todos os logs."
                # Se o arquivo não existe, coleta tudo (não passa --since)
            fi

            # Registrar o timestamp *antes* de buscar os logs. Usar UTC para evitar problemas de fuso horário.
            # Usar formato ISO 8601 com nano segundos para precisão máxima com --since
            # %N pode não funcionar em todos os `date`, mas é o ideal. Se falhar, use %S.
            current_ts=$(date -u +%Y-%m-%dT%H:%M:%S.%NZ 2>/dev/null || date -u +%Y-%m-%dT%H:%M:%SZ)

            # Buscar novos logs e anexar ao arquivo. Redirecionar stderr para stdout para capturar erros.
            error_output=""
            if ! error_output=$(docker logs --timestamps $since_param "$docker_id" >> "$log_file" 2>&1); then
                # Falha ao coletar logs
                echo "ERRO: Falha ao coletar logs para container $short_id (ID completo: $docker_id). Status: $?"
                if [[ -n "$error_output" ]]; then
                   echo "       Mensagem de erro Docker: $error_output"
                fi
                # Não atualiza o timestamp em caso de falha
                failed_count=$((failed_count + 1))
            else
                # Sucesso: Atualiza o arquivo de timestamp com o tempo de início da coleta *desta* vez
                if ! echo "$current_ts" > "$ts_file"; then
                     echo "AVISO: Falha ao escrever timestamp em '$ts_file' para container $short_id."
                fi
                # echo "  [Container $short_id] Logs coletados com sucesso." # Descomente para mais verbosidade
                processed_count=$((processed_count + 1))
            fi
             # Adiciona uma pequena pausa para não sobrecarregar o Docker daemon se houver muitos containers
             sleep 0.1
        done # Fim do loop de containers

        echo "Processamento concluído: $processed_count containers com sucesso, $failed_count com falha."

    fi # Fim do else (containers encontrados)

    echo "-----------------------------------------------------"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Verificação completa. Aguardando $CHECK_INTERVAL segundos para a próxima..."
    sleep "$CHECK_INTERVAL"

done # Fim do loop while true

# Este ponto nunca será alcançado
echo "Script encerrando (não deveria acontecer)."
exit 0
