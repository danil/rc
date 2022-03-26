# GRUB2

## Ubuntu configuration

Applying `/etc/default/grub` and `/etc/grub.d/*`
https://help.ubuntu.com/community/Grub2/Setup#Introduction

    update-grub

## Arch/Gentoo configuration

* https://wiki.archlinux.org/title/GRUB#Generated_grub.cfg
* http://wiki.gentoo.org/wiki/GRUB2#Configuration

    grub2-mkconfig -o /boot/grub/grub.cfg

## Font

<http://wiki.gentoo.org/wiki/GRUB2#Configuration>

    grub2-mkfont /usr/share/fonts/fantasque-sans/FantasqueSansMono-Regular.ttf \
                 --size=20 \
                 --output /boot/grub/fonts/FantasqueSansMono-Regular-20.pcf
