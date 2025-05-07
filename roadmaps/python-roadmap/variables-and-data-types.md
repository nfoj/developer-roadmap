# Variables and Data Types

- Variables
    - int = 7, -2, 12 …
    - float = 7.0, -2.1, 12.9 …
    - bool = true and false
    - str = ‘text’
    

```python
x = "Zara"
y =  10
z =  10.10

print(type(x))
print(type(y))
print(type(z))
```

- Casting

```python
x = str(10)    # x will be '10'
y = int(10)    # y will be 10 
z = float(10)  # z will be 10.0
```

- Case-Sensitivity

```python
age = 20
Age = 30

print( "age =", age )
print( "Age =", Age )
```

- Multiple Assignment

```python
>>> a=10
>>> b=10
>>> c=10

# or

>>> a=b=c=10
>>> print (a,b,c)
10 10 10

# or

>>> a,b,c = 10,20,30
>>> print (a,b,c)
10 20 30

# or 

a = b = c = 100

print (a)
print (b)
print (c)

# or

a,b,c = 1,2,"Zara Ali"
```

- Input

```python
n1 = int(input("Enter the first value: "))
n2 = int(input("Enter the second value: "))

print(f"The sum of {n1} and {n2} = {n1 + n2}")
```

- Format

```python
msg = input("Enter your name: ")
print(f"Hello, {msg}")
```

- Arithmetic operators
    - sum = +
    - subtraction = -
    - multiplication = *
    - division = /
    - integer division = //
    - remainder = %
    - exponentiation = **
    

```python
5 + 4 == 9
5 - 2 == 3
5 * 2 == 10
5 / 2 == 2.5
5 // 2 == 2
5 % 2 == 1 
5 ** 2 == 25
```

- Precede ordination
    - 1 - ()
    - 2 - **
    - 3 - *, / , //, %
    - 4 - +, -

```python
5 + 3 * 2  == 11

3 * 5 + 4 ** 2 == 31
3 * (5 + 4) ** 2 == 243
```
