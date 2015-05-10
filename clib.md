<!-- -*- coding: utf-8; -*- -->

# clib

C package manager-ish <https://github.com/clibs/clib>

## Compile

    git clone https://github.com/clibs/clib.git /tmp/clib
    cd /tmp/clib
    PREFIX=$HOME make install

## Install

    PREFIX=$HOME clib install you/your-package-name

## Uninstall

    PREFIX=$HOME clib-uninstall you/your-package-name
