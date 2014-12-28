<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

Aptitude
========

    aptitude --prompt clean
    aptitude --prompt full-upgrade
    aptitude --prompt purge ~c
    aptitude search . | grep "^i   " \
                      | awk '{ FS = " " ; OFS = " " ; print $2 }' \
                      | less --chop-long-lines --ignore-case
    aptitude show catdoc

Upgrade
=======

Upgrades installed packages to their most recent version

    aptitude update
    aptitude --prompt safe-upgrade

Install
=======

    aptitude install indicator-brightness

Uninstall
=========

    aptitude remove indicator-brightness

Search
======

Installed
---------

<http://unix.stackexchange.com/questions/104374/how-to-show-only-installed-packages-by-executing-aptitude-search#104388>

    aptitude search '~i ^emacs'

### By description

    aptitude search '~i ~d ^emacs'

Not installed
-------------

<http://unix.stackexchange.com/questions/104374/how-to-show-only-installed-packages-by-executing-aptitude-search#104388>

    aptitude search '!~i ^emacs'

### From source

<http://askubuntu.com/questions/437255/how-to-install-emacs-24-4-on-ubuntu#546050>

    aptitude install build-essential
    aptitude build-dep emacs24
    wget http://mirror.team-cymru.org/gnu/emacs/emacs-24.4.tar.gz \
      && tar xf emacs-24.4.tar.gz \
      && cd emacs-24.4
    ./configure --prefix=$HOME \
      && make -j9 \
      && make install
