<!-- -*- coding: utf-8; -*- -->

GNU Privacy Guard
=================

Encrypt
-------

    cat file | bzip2 --stdout | gpg --recipient danil --encrypt > file.bz2

Decrypt
-------

    cat file.bz2 \
    | gpg --recipient danil --decrypt \
    | bzip2 --decompress --stdout > file

Other
-----

    gpg --keyserver subkeys.pgp.net --recv-keys 17072058
    gpg --verify <signature file> <downloaded iso>
