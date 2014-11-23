<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

Disk
====

Validate
========

Validate fstab syntax
<http://serverfault.com/questions/174181/how-do-you-validate-fstab-without-rebooting#509014>.

    mount --verbose --all --fake

Formatting
==========

mke2fs
------

    mkfs.ext2 -L fs_boot /dev/sde1
    mkfs.vfat -F 32 /dev/sdg1

### Set number of inodes

    mkfs.ext4 -N 1000432 /dev/sda5

<http://stackoverflow.com/questions/3618820/how-many-bytes-per-inodes>.

    tune2fs -l /dev/sda5 | grep Inode

Free/used space
===============

    df -hi

Finding largest files/directories
---------------------------------

* <http://superuser.com/questions/9847/linux-utility-for-finding-the-largest-files-directories>
* <http://cyberciti.biz/faq/how-do-i-find-the-largest-filesdirectories-on-a-linuxunixbsd-filesystem/>
* <http://cyberciti.biz/faq/find-large-files-linux/>

    du -hx ./ |grep -E ^[0-9.,]+[MG]
    find  -ctime +30 -daystart -type d \
      | xargs du -b 2>/dev/null \
      | awk '{total += $1; print $0} END{print total}'

dd
==

Copy partition
--------------

* <https://wiki.archlinux.org/index.php/disk_cloning>
* <http://askubuntu.com/questions/173907/when-cloning-ext4-partition-with-the-dd-command-to-a-bigger-partition-free-spa#173968>
* <https://linode.com/docs/migrate-to-linode/disk-images/copying-a-disk-image-to-a-different-account#copying-the-disk-image>

    dd if=/dev/sda98 of=/dev/sda99

### Free free space

    resize2fs /dev/sda99

Create ISO
----------

Copy from cd-rom disc to ISO image

    dd if=/dev/cdrom of=myimage.iso

Other
-----

    dd if=/dev/sdb of=mybackup.img bs=130M count=1
    dd if=bootldr.rom of=/dev/sdb
    dd if=debian-eeepc.img of=/dev/sdf

Other
=====

    bchunk Dungeon_Keeper.BIN Dungeon_Keeper.cue Dungeon_Keeper.iso
    modprobe loop && mount -t iso9660 -o loop tmp/fdfullcd.iso mnt/iso
    mount -t vfat /dev/sdc1 mnt/usbdisk/ \
          -o uid=danil,gid=danil,nosuid,shortname=mixed,umask=077
    mount -t ext2 ~/restore.img /mnt/img -o ro,loop,offset=32256
    mount -t cifs "//192.168.91.3/store (e)" mnt/black_server/ \
          -o "workgroup=darout,username=danil,iocharset=utf8,codepage=cp1251"
    mount --rbind olddir newdir
    fsck /dev/sdg1
    touch /forcefsck
