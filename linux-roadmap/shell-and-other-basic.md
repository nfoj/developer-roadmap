# Shell and Other Basic


## Command Path

In Linux, the command path is an important concept under shell basics. Simply put, command path is a variable that is used by the shell to determine where to look for the executable files to run. Linux commands are nothing but programs residing in particular directories. But, one does not have to navigate to these directories every time to run these programs. The command path comes to the rescue!

```
echo $PATH
  
```


## Environment Variables

A powerful tool to manipulate environment variables, which are pieces of information that influence the behavior of programs and the system itself.

```
  env
  SHELL=/usr/bin/bash
  COLORTERM=truecolor
  PWD=/home/user
  
```

- What is env used for?

Testing programs
Running scripts with specific configurations
Managing dependencies
Isolation

```
  env HOST=meu_banco_de_dados USUARIO=meu_usuario SENHA=minha_senha python meu_script.py
  
```


## Command Help

- Help: <command> --help | man <command> | info <comando>

```
  // ls
  ls --help

  // man
  man ls

  // info
  info ls

```


# Redirects

Control the flow of command input and output.

- > : command that redirects the output and overwrites the final file 

```
  command > file.txt

  ls -l > file_list.txt
  
```

- >> : command that redirects the output and does not overwrite the final file

```
  command >> file.txt

  ls -l >> file_list.txt
  
```

- < : Redirecting Input

```
  command < file.txt

  wc -l < file.txt
  
```

- < comand > : Input/Output Redirection

```
  command < input.txt > output.txt
  
```

- &> | 2>&1 : Output and Standard Error Redirection

```
  command &> error.txt
  command 2>&1 error.txt 
  
```


## Super User

The Super User, also known as “root user”, represents a user account in Linux with extensive powers, privileges, and capabilities. This user has complete control over the system and can access any data stored on it. This includes the ability to modify system configurations, change other user’s passwords, install software, and perform more administrative tasks in the shell environment.

- What the superuser can do:

Install and remove software
Manage users and groups
Configure the system
Manage the file system
Manage processes
Access hardware
Perform maintenance tasks
Execute any command


### Package Management

- apt-get update: Updates the list of available packages.

```
  sudo apt-get update
  
```

- apt-get upgrade: Upgrades installed packages to their latest versions.

```
  sudo apt-get upgrade
  
```

- apt-get install <package>: Installs a package.

```
  sudo apt-get install vim
  
```

- apt-get remove <package>: Removes a package.

```
  sudo apt-get remove vim
  
```

- apt-get purge <package>: Removes a package and its configuration files.

```
  sudo apt-get purge vim
  
```
