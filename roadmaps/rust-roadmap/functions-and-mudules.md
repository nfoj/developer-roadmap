# Functions and Method Syntax**

- Functions

```rust
  fn basic() {
      println!("Hello, world!");
  }

  fn main() {
      // basic
      basic();
  }
```

- parameters

```rust
  fn parameter(x: i8) {
      println!("x = {}", x);
  }

  fn main() {
      // parameter
      parameter(1);
  }
```

```rust
 fn parameter_00(x: i8, y: i8) {
      // 00
      println!("{} + {} = {}", x, y, x + y);
	}
  
  fn main() {
      // 00
      parameter_00(1, 2);
  }
```

- expression: →

```rust
  fn expression_01(x: i8, y: i8) -> i8 {
      // 01
      x + y
  }

  fn main() {
      // 01
      println!("{}", expression_01(7, 7));
  }
```

- not use: indicates that the function will not be used

```rust
#[allow(dead_code)]
fn hello () {
	println!("Hello, world!");
}

fn main () {
	println!("...");
}
```

> [!TIP]
Organize your code using modules, in the same file or outside it
> 

- modules

```rust
  mod cal {

      pub fn sum(a: i8, b: i8) -> i8 {
          a + b
      }

      pub fn sub(c: i8, d: i8) -> i8 {
          c - d
      }
  }

  mod text {

      pub fn tprint() {
          println!("Hello, world!");
      }
  }

  fn main() {
      let sum = cal::sum(1, 2);
      println!("Result: {}", sum);

      let sub = cal::sub(5, 2);
      println!("Result: {}", sub);

      text::tprint();
  }
```

- files + modules

```rust
// tree
project/
├── Cargo.toml
└── src/
    ├── main.rs
    ├── sum.rs
    ├── sub.rs
    ├── mult.rs
    └── div.rs
    
// sum.rs
pub fn cal_sum(a: i8, b: i8) -> i8 {
	a + b
}

// sub.rs
pub fn cal_sub(c: i8, d: i8) -> i8 {
	c - d
}

// mult.rs
pub fn cal_mult(e: i8, f: i8) -> i8 {
	e * f
}

// div.rs
pub fn cal_div(g: i8, h: i8) -> i8 {
	g / h
}

// main.rs
mod sum;
mod sub;
mod mult;
mod div;

fn main() {
   let result_sum = sum::cal_sum(1, 1);
   println!("Rsult sum = {}", result);

   let result_sub = sub::cal_sub(2, 2);
   println!("Result sub = {}", result);

   let result_mult = mult::cal_mult(3, 3);
   println!("Rsult multi = {}", result);
   
   let result_div = mult::cal_div(4, 4);
   println!("Rsult multi = {}", result);
   
}
```
