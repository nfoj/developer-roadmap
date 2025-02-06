# Editing Files

## Vim

- Navegation

```
h: Move the cursor one character to the left
j: Move the cursor one line down
k: Move the cursor one line up
l: Move the cursor one character to the right
w: Move the cursor to the beginning of the next word
b: Move the cursor to the beginning of the previous word
0: Move the cursor to the beginning of the current line
$: Move the cursor to the end of the current line
gg: Move the cursor to the beginning of the file
G: Move the cursor to the end of the file
  
```

- Editing

```
i: Enter insert mode before the cursor
a: Enter insert mode after the cursor
o: Open a new line below the cursor and enter insert mode
dd: Delete the current line
yy: Yank (copy) the current line
p: Paste the yanked content after the cursor
u: Undo the last change
Ctrl+r: Redo the last undone change
  
```

- Files

```
:w: Save the file
:q: Quit Vim (if there are no unsaved changes)
:wq: Save the file and quit Vim
:q!: Quit Vim without saving changes
:e <filename>: Open another file
  
```

- Search and Replace

```
/ <text>: Search for the specified text
n: Find the next occurrence of the searched text
N: Find the previous occurrence of the searched text
:%s/<old_text>/<new_text>/g: Replace all occurrences of the old text with the new text
  
```


## Nano

- Movement

```
Ctrl + F: Page Down
Ctrl + B: Page Up
Ctrl + A: Go to the beginning of the line
Ctrl + E: Go to the end of the line
Arrow keys: Move the cursor
  
```

- Editing

```
Ctrl + O: Open a file to edit
Ctrl + R: Insert the contents of another file
Ctrl + W: Search for text
Ctrl + K: Cut the current line
Ctrl + U: Paste the cut text
Ctrl + J: Justify the paragraph
Ctrl + _: Undo the last action
Ctrl + ^: Redo the last undone action
  
```

- Text

```
Ctrl + 6: Mark the beginning of a block to copy or move
Ctrl + K: Cut the marked block
Ctrl + U: Paste the cut block
Ctrl + J: Justify the marked block
  
```

- File

```
Ctrl + X: Exit Nano (asks if you want to save changes)
Ctrl + S: Save the file
Ctrl + W: Save the file with another name
  
```

- Help

```
Ctrl + G: Display the help screen with all commands  

```
