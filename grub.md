<!-- -*- coding: utf-8; -*- -->

GRUB2
=====

Configuration
-------------

<http://wiki.gentoo.org/wiki/GRUB2#Configuration>

    grub2-mkconfig -o /boot/grub/grub.cfg

Font
----

<http://wiki.gentoo.org/wiki/GRUB2#Configuration>

    grub2-mkfont /usr/share/fonts/fantasque-sans/FantasqueSansMono-Regular.ttf
                 --size=20
                 --output /boot/grub/fonts/FantasqueSansMono-Regular-20.pcf
