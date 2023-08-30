# [Rust][] programing language/[Cargo][] rc

[rust]: https://github.com/rust-lang/rust
[cargo]: https://github.com/rust-lang/cargo

## Install <sup>[1][] [2][]</sup>

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

[1]: http://rustup.rs
[2]: https://www.rust-lang.org/tools/install

## Cargo install package

    cargo install your-pkg

## Cargo install specific version

    cargo install --version=1.2.3 your-pkg

## `Cargo.toml` package build/install

    cargo build

## Cargo update/upgrade package

    cargo install --force your-pkg

## `Cargo.toml` package update/upgrade

    cargo update

## Cargo uninstall package

    cargo uninstall your_pkg_nm
