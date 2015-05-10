<!-- -*- coding: utf-8; -*- -->

# clib

C package manager-ish <https://github.com/clibs/clib>

## Compile

    git clone https://github.com/clibs/clib.git /tmp/clib
    cd /tmp/clib
    PREFIX=$HOME make install

## Install

Packages list <https://github.com/clibs/clib/wiki/Packages>

    PREFIX=$HOME clib install your/package-name

## Uninstall

    PREFIX=$HOME clib-uninstall your/package-name
