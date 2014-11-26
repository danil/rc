<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

Linux
=====

Compile
-------

* <https://www.gentoo.org/doc/en/handbook/handbook-amd64.xml?style=printable&part=1&chap=7#doc_chap2_sect3>
* <http://unix.stackexchange.com/questions/51815/why-people-recommend-the-j3-option-for-make-when-having-a-dual-core-cpu#51861>

    make -j9

Install
-------

<https://www.gentoo.org/doc/en/handbook/handbook-amd64.xml?style=printable&part=1&chap=7#doc_chap2_sect3>

    make install && grub2-mkconfig --output=/boot/grub/grub.cfg
    make modules_install && emerge --verbose --oneshot --color=y @module-rebuild
