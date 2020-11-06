# bpkg

Lightweight bash package manager
<http://www.bpkg.io>,
<https://github.com/bpkg/bpkg>

## Install

    curl -Lo- http://get.bpkg.io | PREFIX=$HOME bash
    export PATH=$PATH:$HOME/deps/bin

## Uninstall

    rm `which bpkg`*

## Usage

### Install

Packages list <https://github.com/bpkg/bpkg/wiki/index>

    bpkg install your/pkg-name
