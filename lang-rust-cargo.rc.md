# [Rust][] programing language/[Cargo][] rc

[rust]: https://github.com/rust-lang/rust
[cargo]: https://github.com/rust-lang/cargo

## HOWTO Install by [Homebrew][]

    brew install rust

[homebrew]: https://formulae.brew.sh/formula/rust#default

## HOWTO [Install][] by [rustup][]

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

[install]: https://rust-lang.org/tools/install
[rustup]: http://rustup.rs

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
