<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

Arch
====

Pacman
------

### Update and upgrade

Download package list

    pacman --sync --verbose --refresh --sysupgrade

### Install

    yaourt --verbose --sync lightdm-gtk3-greeter

### Remove

    pacman --remove --recursive cairo-dock-plugins

AUR
---

Arch User Repository <https://wiki.archlinux.org/index.php/Arch_User_Repository>.

### PKGBUILD

<https://wiki.archlinux.org/index.php/Arch_User_Repository#Installing_packages>

#### Compile and pack

    makepkg -s

#### Install

    pacman --upgrade yaourt-1.3-1-any.pkg.tar.xz

Yaourt
------

Yet AnOther User Repository

Search and install
------------------

    yaourt compiz-dev
