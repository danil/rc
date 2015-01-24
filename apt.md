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

    apt-get update
    apt-get --show-upgraded upgrade
    apt-get --show-upgraded dist-upgrade
    apt-cash [--full] search emacs
    apt-cash show emacs
    apt-cache depends penguin-command
    apt-get --target-release testing install emacs22-nox
    apt-get --purge remove xyz
    apt-get clean
    apt-cdrom [--cdrom /home/danil/mnt/cdrom] add
    apt-key add archive-key-eeepc.asc
    apt-mark unmarkauto
    reprepro
    wget --output-document=- http://backports.org/debian/archive.key | apt-key add -

Get release version
===================

    lsb_release --all

Repository
==========

Add
---

    add-apt-repository ppa:indicator-brightness/ppa
    apt-get update

Remove
------

    add-apt-repository --remove ppa:indicator-brightness/ppa
    apt-get update

Finding which package contains a file
=====================================

<http://debian-administration.org/articles/334>

    apt-file update
    apt-file search /usr/bin/ag
