<!-- -*- coding: utf-8; -*- -->

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
