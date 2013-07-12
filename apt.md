<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

APT
===

Advanced Packaging Tool

Repository
----------

### Add

    add-apt-repository ppa:indicator-brightness/ppa
    apt-get update

### Remove

    add-apt-repository --remove ppa:indicator-brightness/ppa
    apt-get update

Finding which package contains a file
--------------------------------------

<http://debian-administration.org/articles/334>

    apt-file update
    apt-file search stdio.h

    apt-key add archive-key-eeepc.asc
    apt-mark unmarkauto
    reprepro
    dpkg-scanpackages
    wget -O - http://backports.org/debian/archive.key |apt-key add -
    aptitude -P clean
    aptitude -P update
    aptitude -P safe-upgrade
    aptitude -P full-upgrade
    aptitude -P purge ~c
    aptitude search . |grep "^i   " \
                      |awk '{ FS = " " ; OFS = " " ; print $2 }' \
                      |less -SI
    aptitude show catdoc

Other
-----

    apt-get update
    apt-get -u upgrade
    apt-get -u dist-upgrade
    apt-cash [--full] search emacs
    apt-cash show emacs
    apt-cache depends penguin-command
    apt-get -t testing install emacs22-nox
    apt-get --purge remove xyz
    apt-get clean
    apt-cdrom [-d /home/danil/mnt/cdrom] add

Aptitude
========

Install
-------

    aptitude install indicator-brightness

Uninstall
---------

    aptitude remove indicator-brightness

dpkg
====

Debian package

See installed version
---------------------

    dpkg -s emacs21-nox

Install
-------

<http://cyberciti.biz/faq/ubuntu-linux-how-do-i-install-deb-packages>

    dpkg -i google-talkplugin_current_amd64.deb

Other
-----

    dpkg -l emacs*
    dpkg -L emacs21-nox
    dpkg -S stdio.h
    dpkg-architecture
    dpkg-reconfigure xserver-xorg locales
    dpkg -x xlibs_4.3.0.dfsg.1-14sarge7_all.deb ./
