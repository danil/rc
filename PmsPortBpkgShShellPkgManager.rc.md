# bpkg rc

Lightweight bash package manager
<http://bpkg.io>,
<https://github.com/bpkg/bpkg>

## Install bpkg

    curl -Lo- http://get.bpkg.io | PREFIX="$HOME" bash
    export PATH="$PATH":"$HOME"/deps/bin

## Uninstall bpkg

    rm `which bpkg`*

## Install

Packages list <https://github.com/bpkg/bpkg/wiki/index>

    bpkg install your/pkg-nm
