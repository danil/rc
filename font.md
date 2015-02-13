<!-- -*- coding: utf-8; -*- -->

Font
====

Get default
-----------

<http://stackoverflow.com/questions/2153772/linux-firefox-default-sans-serif-font#2539979>.

    fc-match sans-serif
    fc-match monospace

Rebuilding cache
----------------

* <https://wiki.archlinux.org/index.php/fonts#Manual_installation>
* <https://wiki.ubuntu.com/Fonts#Manually>

    sudo fc-cache --force --verbose
