# [Rust][] programing language/[Cargo][] rc

[rust]: https://github.com/rust-lang/rust
[cargo]: https://github.com/rust-lang/cargo

* HOWTO VER2 Install by [Homebrew][] `brew install rust` <sup><sub>[3478130715][]</sub></sup>
* HOWTO VER1 Install by [rustup][] `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh` <sup><sub>[4266140190][]</sub></sup>

[homebrew]: https://github.com/homebrew/brew
[rustup]: http://rustup.rs
[3478130715]: https://formulae.brew.sh/formula/rust#default
[4266140190]: https://rust-lang.org/tools/install

## HOWTO [Hello, World!][]

```rust
fn main() {
    println!("Hello, World!");
}
```

```sh
$ rustc main.rs
$ ./main
Hello, World!
```

[hello, world!]: https://doc.rust-lang.org/book/ch01-02-hello-world.html#writing-and-running-a-rust-program

## HOWTO Cargo install package

    cargo install your-pkg

## HOWTO Cargo install specific version

    cargo install --version=1.2.3 your-pkg

## HOWTO `Cargo.toml` package build/install

    cargo build

## HOWTO Cargo update/upgrade package

    cargo install --force your-pkg

## HOWTO `Cargo.toml` package update/upgrade

    cargo update

## HOWTO Cargo uninstall package

    cargo uninstall your_pkg_nm
