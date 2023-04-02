# clib rc

C package manager-ish <https://github.com/clibs/clib>

## Install

    git clone https://github.com/clibs/clib.git /tmp/clib
    cd /tmp/clib
    PREFIX="$HOME" make install

## Uninstall

    git clone https://github.com/clibs/clib.git /tmp/clib
    cd /tmp/clib
    PREFIX="$HOME" make uninstall

## Usage

### Install

Packages list <https://github.com/clibs/clib/wiki/Packages>

    PREFIX="$HOME" clib install your/pkg-nm

### Uninstall

    PREFIX="$HOME" clib-uninstall your/pkg-nm
