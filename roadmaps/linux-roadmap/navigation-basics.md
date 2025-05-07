# Navigation Basics

- In Linux, navigating between directories and files is essential and allows you to explore the power of the command-line interface (CLI). Mastering basic commands like cd, pwd, ls, and tree makes it possible to move easily through the file system, display lists of files and directories, and understand your position in relation to other components of the system.


## Basic Commands

- Show directory: pwd

```
  pwd
  /home/user
  
```

- Tab: autocomplete
  
```
  tab + <name>
  
```

- List content: ls, ls -a, ls -la

```
  ls 
  downloads  git

  ls *
  arq  arq1  arq2

  dir:
  dir 1
    
  ls -a
  .  ..  .bash_history  .bash_logout

  la -la
  drwx------ 1 user user  280 Aug 16 06:31 .
  drwxr-xr-x 1 root root    8 Jul 28 00:00 ..
  
```

- Globbing: *, ? and []

```
  // files all
  ls arq*
  ls *1*

  // ? = substitutes any character
  ls arq1?
  ls arq??

  // [] = ranger of value
  ls arq[1-5]
  ls *[1-5]
  ls arq[1,2,5]
  ls ???[1-5]
  ls ???[1-5]*
  ls [A,a]rq[1-5]

```

- Clear screen: clear or ctrl + l
  
```
  clear
  ctrl + l
  
```

- Help: <command> --help | man <command> | info <comando> 

```
  // ls 
  ls --help

  // man
  man ls

  // info
  info ls

```

- FHS (Filesystem): cd | . = hidden files 
  
```
  cd 
  home/user

  // hidden files
  cd .config
  alacritty  dconf  gtk-3.0

  // return
  cd -
  cd /etc

  // next 
  cd ../.config/ 

```


## Moving Files

- Create directories: dir
  
```
  mdkir <name>

  // name + space
  mkdir <name>\ <name>

  // multiples directories
  mkdir -p dir/dir/dir1/dir2  

  // ocult directories
  mdkir .<name>
  
```

- Create files: touch or >

```
  touch <name>
  touch arq.txt
    
  > <name>
  > arq.txt

  // multiples files
  touch <name> <name2> <name3>

  // ocult files
  touch .<name>
    
```

- Remove: rm <name> or rm -r <name> or rm -rf <name>
  
```
  // files
  rm <name>

  // dir 
  rm -r 

  // delete all
  rm -rf
    
```

> [!WARNING]  
> Be careful when deleting a file or folder. You can only recover it if you have backup software installed or if you've made a backup..


## Copy and Moving Files

- Copy
  
```
  cp <nome> path

  // cp all
  cp -r * path
  cp -r * ../dir2/dir3
    
```

- Move: mv <name> <path>

```
  // mv
  mv arq.txt git/python
  
```


## Directory Hierarchy

/: Root directory, the top level of the file system.
/home: User home directories.
/bin: Essential binary executables.
/sbin: System administration binaries.
/etc: Configuration files.
/var: Variable data (logs, spool files).
/usr: User programs and data.
/lib: Shared libraries.
/tmp: Temporary files.


```

  tree

  // -a = hidden files
  tree -a

  // -d = directories 
  tree -d

  // -f = path complet
  tree -f
  
```
