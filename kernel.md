<!-- -*- coding: utf-8; -*- -->

Linux
=====

Compile
-------

* <https://www.gentoo.org/doc/en/handbook/handbook-amd64.xml?style=printable&part=1&chap=7#doc_chap2_sect3>
* <http://unix.stackexchange.com/questions/51815/why-people-recommend-the-j3-option-for-make-when-having-a-dual-core-cpu#51861>

    make --jobs=9

Install
-------

<https://www.gentoo.org/doc/en/handbook/handbook-amd64.xml?style=printable&part=1&chap=7#doc_chap2_sect3>

    make install && grub2-mkconfig --output=/boot/grub/grub.cfg
    make modules_install && emerge --verbose --oneshot --color=y @module-rebuild
