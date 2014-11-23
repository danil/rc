<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

Partitions
==========

lsblk
=====

List partitions:
* <https://wiki.archlinux.org/index.php/persistent_block_device_naming#Persistent_naming_methods>
* <https://wiki.archlinux.org/index.php/fstab#Kernel_name_descriptors>

    lsblk

GPT
===

<http://gentoo.org/doc/en/handbook/handbook-amd64.xml?part=1&chap=4>

    parted /dev/sda

<https://wiki.archlinux.org/index.php/Partitioning#Partitioning_tools>.

    gdisk /dev/sda

      Name     Flags    Part Type   FS Type            [Label]       Size (MB)
    ---------------------------------------------------------------------------
      sda1     Boot      Primary    Linux ext4         [fs_bios]        100,00
      sda2               Primary    Linux ext4         [fs_boot]       1000,00
      sda3               Primary    Linux swap / Solaris               9000,00
      sda4               Primary    Linux ext4         [fs_root]     109000,00

MBR
===

Legacy!

    fdisk -l /dev/sdb
    sfdisk -l -uM

      Name     Flags    Part Type   FS Type            [Label]       Size (MB)
    ---------------------------------------------------------------------------
      sda1     Boot      Primary    Linux ext4         [fs_boot]       1000,00
      sda2               Primary    Linux swap / Solaris               9000,00
      sda3               Primary    Linux ext4         [fs_root]     110000,00

cfdisk
======

Warning
-------

<https://wiki.archlinux.org/index.php/Partitioning#Partitioning_tools>.

The first partition created by `cfdisk` starts at sector 63,
instead of the usual 2048. This can lead to reduced performance on _SSD_
and advanced format (4k sector) drives.
It will cause problems with _GRUB2_.
GRUB legacy and Syslinux should work fine.
