# Working with Files

## Soft and Hard Links

- Soft link: it's like a 'shortcut' to another file or directory.

```bash
# ln = link
# -s = soft
# ln -s name_file_OR_directory name_soft_link 

ln -s source_file.txt soft_link.txt
```

- Hard link: it's like an 'alternate name' for an existing file. It points directly to the same data on the hard drive (inode).

```bash
# ln = link 
# ln -s name_of_file_OR_directory name_soft_link 

ln source_file.txt hard_link.txt
```

## Copying and Renaming Files

- Copy

```bash
  cp <nome> path
  cp all
  
  cp -r * path
  cp -r * ../dir2/dir3
```

- Move

```bash
  # mv name_of_file_OR_directory path
  
  mv arq.txt git/python
```

- Rename

```bash
# mv name_file new_name_file 
mv oldfile.txt newfile.txt

# rename: batch renaming files
	# Example: replaces the extension '.txt' with '.md
	# s/ = start
	# \.txt = rename
	# $/.md/ = substitute 
	# *.txt = all files
	
rename 's/\.txt$/.md/' *.txt
```

## Archiving and Compressing

- tar: combine multiple files and directories into a single file, called a 'tarball'. It does not perform compression.

```bash
# To create a tar archive:
tar cvf archive_name.tar directory_to_archive/

# To extract a tar archive:
tar xvf archive_name.tar
```

- gzip and bzip2: compression tool. Its function is to reduce the size of a single file.

```bash
# gpiz

# compression
gzip file_of_name

# descompression
gzip -d file_of_name.gz

# compression with cp
gzip -k file_of_name

# level compression (1-9) the higher the number, 
# the greater the compression and the longer the time.
gzip -6 file_of_name
```

```bash
# bzip2

# compression
bzip2 file_of_name

# descompression
bzip2 -d file_of_name.bz2

# compression with cp
bzip2 -k file_of_name

# level compression (1-9) the higher the number, 
# the greater the compression and the longer the time.
bzip2 -6 file_of_name
```

- tar + gzip

```bash
# compression
tar -czvf arquivo.tar.gz diretório

# descompression
tar -xzvf arquivo.tar.gz
```

- tar + bzip2

```bash
# compression
tar -cjvf arquivo.tar.bz2 diretório

#descompression
tar -xjvf arquivo.tar.bz2
```

## User and Groups

- Create Users

```bash
  // Create - No configure
  useradd <name>

  // Create user and group
  adduser <name>

  // verification users
  cat /etc/group | grep <name>

  // verification password
  cat /etc/shadow | grep <name>

  //delete
  userdel <name>
```

- Groups

```bash
    // create group
    groupadd projects

    // verification
    cat /etc/group

    // add user
    usermod -aG <name-group> <nome-user>

    // verification
    groups <name-user>

    // delete
    groupdel <name-group>
```

## File Permissions

- Permission
    - sudo chmod -R 755
        - r: read
        - w: write
        - x: execute
        - d: directory
        - -: file
        
        - u-: user
        - g-: group
        - o-: owner
        
        - 755:rwx r-x r-x
        - 7: rwx(User)
        - 5: r-x(Group)
        - 5: r-x(other)
        
    - Numerical Presentation
        - 7: rwx
        - 6: rw-
        - 5: r-x
        - 4: r--
        - 3: -wx
        - 2: -w-
        - 1: --x
        - 0: ---

OBS: A directory or file can only have one owner and one group

```bash
  // permission
  chmod 700 <name-file> or <name-dir>
  chmod o-r <name-file> or <name-dir>

  // permission user
  chown <name-user> <name-file> or <name-dir>

  // permission group
  chgrp <name-group> <name-file> or <name-dir>

  // permission user and group
  chon <name-user>:<name-group> <name-file> or <name-dir>

  // special permission (Tree)
  chmod g+s <name-file> or <nome-dir>

```