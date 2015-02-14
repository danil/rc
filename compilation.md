<!-- -*- coding: utf-8; -*- -->

Compilation
===========

    su -c make -f Makefile.cvs install
    make --jobs=5 && make install
    make menuconfig # make oldconfig

Configuration
=============

<https://bbs.archlinux.org/viewtopic.php?pid=1258673#p1258673>

    libtoolize --force
    aclocal
    autoheader
    automake --force-missing --add-missing
    autoconf
    ./configure --prefix=$HOME --with-baseruby="/home/danil/bin/ruby" \
                --enable-shared --enable-pthread --enable-install-doc
