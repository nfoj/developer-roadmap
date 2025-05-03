#!/usr/bin/env bash

# author: nfoj_@hotmail.com
# description: script for connection check
# system: arch linux
#!--------------------------------------!#
# Color
# Style           |   # Colors       | # background
# 00: none        |   # 30: black    | # 40: black
# 01: Bold        |   # 31: red      | # 41: red
# 03: Italic      |   # 32: green    | # 42: green
# 04: Underlined  |   # 33: yellow   | # 43: yellow
# 05: Blinking    |   # 34: blue     | # 44: blue
# 07: Reverse     |   # 35: magenta  | # 45: magenta
# 08: Hidden      |   # 36: cyan     | # 46: cyan
#                 |   # 37: white    | # 47: white
# Note:
# '\033[Style;Color;Backgroundm'
# STYLE_COLOR_BACKGROUND='\033[00;00;00m'

COLOR_BLUE='\033[1;34m'
COLOR_RED='\033[1;31m'
COLOR_GREEN='\033[1;32m'
NO_COLOR='\033[0m'

#!--------------------------------------!#

# docker_logs=$(docker logs --follow --tail 1 --timestamps "$docker_id")

# Loop externo para repetir a ação periodicamente
while true; do

  # check container
  docker_check=$(docker ps)

  if head -n 1 <<< "$docker_check" | grep -q .; then
    echo "Docker containers found. Processing..."
  else
    echo "Nenhum container Docker rodando. Verificando novamente em 60 segundos."
    # Espera antes de tentar novamente se não houver containers
    sleep 60
    continue # Pula para a próxima iteração do loop while true
  fi

  #
  echo "##############################################"
  #

  # create a folder for each id and log
  echo "$docker_check" | tail -n +2 | while IFS= read -r i; do
    docker_id=$(echo "$i" | awk '{print $1}')
    
    # Garante que a pasta exista (mkdir -p não falha se já existir)
    mkdir -p "$docker_id"
    
    if [ -d "$docker_id" ]; then
      log_file="$docker_id/$docker_id.log"
      docker logs --timestamps "$docker_id" >> "$log_file"
    else
      echo "Falha ao criar/encontrar a pasta '$docker_id'"
    fi
  done

  #
  echo "##############################################"
  #

  # Espera um tempo antes de repetir a verificação
  echo "Verificação completa. Esperando 60 segundos para a próxima verificação."
  sleep 60

done

# Este ponto do script NUNCA será alcançado com o while true

