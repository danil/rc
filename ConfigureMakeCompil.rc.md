# Compilation rc

## Configuration

<https://bbs.archlinux.org/viewtopic.php?pid=1258673#p1258673>

    libtoolize --force
    aclocal
    autoheader
    automake --force-missing --add-missing
    autoconf
    ./configure --prefix="$HOME" --with-baseruby="/home/danil/bin/ruby" \
                --enable-shared --enable-pthread --enable-install-doc

## Make

GNU make, BSD make, Microsoft nmake and so on <https://makefile.site>.

    make --jobs=5 && make install

## Make rebuild

    make --always-make

## Configure Linux kernel

    make menuconfig || make oldconfig
