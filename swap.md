<!-- -*- coding: utf-8; -*- -->

Swap
====

File
====

<https://wiki.archlinux.org/index.php/swap#Swap_file>

Create file
-----------

    fallocate --length=4GB /swapfile

or

    dd if=/dev/zero of=/swapfile bs=1M count=4000

Other
-----

    chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile

Partition
=========

<https://wiki.archlinux.org/index.php/swap#Swap_partition>

    mkswap /dev/sda3 && swapon /dev/sda3
    swapon -s
    swapoff -a
