# Basic Syntax

## Interactive Mode

```
// Terminal
$ python3
>>> print ("Hello, World!")
```

## Create file .py

```
$ test.py
print ("Hello, World!")
$ python3 test.py

// or

$ test.py
#!/usr/bin/python3
print ("Hello, World!")
$ chmod +x test.py
$./test.py
```

## Quote

- Single ('), double (") and triple (''' or """) quotes to denote string literals, as long as the same type of quote starts and ends the string.

```python
word = 'word'
print (word)

sentence = "This is a sentence."
print (sentence)

paragraph = """This is a paragraph. It is
 made up of multiple lines and sentences."""
print (paragraph)
```

## Comments

```python
# This is a comment.

# or

'''
This is a multiline
comment.
'''
```
