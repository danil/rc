<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2014 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

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
