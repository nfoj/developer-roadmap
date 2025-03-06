## Rust

- Function:

fn name (variable : type | type | type, type) -> type {
  x + y;
  return;
}
  
Example:

fn name (first: &str) -> String {
  let first_name : String = format!("[0]", first);
  return first;
}

```rust

fn main () {
  println!("Hello from rust, ");
}


fn get_full_name (first: &str, last: &str) -> String {
  let full_name : String = format!("[0] [1]", first, last);
  return full_name;
}


  
```

Not using?

#[allow(dead_code)]
fn main () {}

