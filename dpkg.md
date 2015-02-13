<!-- -*- coding: utf-8; -*- -->

dpkg
====

Debian package

    dpkg --list emacs*
    dpkg --listfiles emacs21-nox
    dpkg --search stdio.h
    dpkg-architecture
    dpkg-reconfigure xserver-xorg locales
    dpkg --extract xlibs_4.3.0.dfsg.1-14sarge7_all.deb ./
    dpkg-scanpackages

Package version
===============

    dpkg --status emacs21-nox

Install
=======

<http://cyberciti.biz/faq/ubuntu-linux-how-do-i-install-deb-packages>

    dpkg --install google-talkplugin_current_amd64.deb

Remove
======

    dpkg --remove google-talkplugin_current_amd64.deb

Files belongs to package
========================

<http://askubuntu.com/questions/32507/how-do-i-get-a-list-of-installed-files-from-a-package#32509>

    dpkg-query --listfiles <package_name>
