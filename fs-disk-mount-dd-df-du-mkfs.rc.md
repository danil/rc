# Disk

## List

    blkid

## Validate

Validate fstab syntax
<http://serverfault.com/questions/174181/how-do-you-validate-fstab-without-rebooting#509014>.

    mount --verbose --all --fake

## Format by mke2fs

    mkfs.ext2 -L fs_boot /dev/sde1

## Format by mke2fs to fat32

Format usb to fat32 (a-la `mkdosfs`)

    mkfs.vfat -F 32 /dev/sdg1

## Set number of inodes by mke2fs

    mkfs.ext4 -N 1000432 /dev/sda5

<http://stackoverflow.com/questions/3618820/how-many-bytes-per-inodes>.

    tune2fs -l /dev/sda5 | grep Inode

## Free/used space

    df -hi

## Directories list sizes

    du -sh ./*/

## Finding largest files/directories

* <http://superuser.com/questions/9847/linux-utility-for-finding-the-largest-files-directories>
* <http://cyberciti.biz/faq/how-do-i-find-the-largest-filesdirectories-on-a-linuxunixbsd-filesystem/>
* <http://cyberciti.biz/faq/find-large-files-linux/>

    du --all /var/log | sort --numeric-sort --reverse | head --lines=20
    du --human-readable --one-file-system ./ | grep --extended-regexp ^[0-9.,]+[MG]
    find  -ctime +30 -daystart -type d \
      | xargs du -b 2>/dev/null \
      | awk '{total += $1; print $0} END{print total}'

## Get UUID

<http://unix.stackexchange.com/questions/658/linux-how-can-i-view-all-uuids-for-all-available-disks-on-my-system#660>

    ls -l /dev/disk/by-uuid | grep sda1

## dd copy partition

* <https://wiki.archlinux.org/index.php/Disk_cloning>
* <http://askubuntu.com/questions/173907/when-cloning-ext4-partition-with-the-dd-command-to-a-bigger-partition-free-spa#173968>
* <https://linode.com/docs/migrate-to-linode/disk-images/copying-a-disk-image-to-a-different-account#copying-the-disk-image>

    dd if=/dev/your-source1 of=/dev/your-destination1 bs=512 conv=sync

## dd free free space

    resize2fs /dev/sda99

## dd create ISO

Copy from cd-rom disc to ISO image

    dd if=/dev/cdrom of=myimage.iso

## dd create usb

Copy ISO image to bootable usb

    dd if=path/to/your.iso of=/dev/your-usb

## dd benchmark

<https://haydenjames.io/web-host-doesnt-want-read-benchmark-vps>

    dd if=/dev/zero of=/tmp/foobar bs=1M count=1024 conv=fdatasync

## dd other

    dd if=/dev/sdb of=mybackup.img bs=130M count=1
    dd if=bootldr.rom of=/dev/sdb
    dd if=debian-eeepc.img of=/dev/sdf

## Free space/space usage

* `dust` show disk space usage, is an du replacement https://github.com/bootandy/dust
* `diskonaut` terminal disk space navigator https://github.com/imsnif/diskonaut
* `ncdu` show disk space usage, is an `baobab` and `gt5` replacement https://dev.yorhel.nl/ncdu

## Find duplicate files

* `ddh` Written in Rust programming language <https://github.com/darakian/ddh>.
* `fclones` Written in Rust programming language <https://github.com/pkolaczk/fclones>.
* `fdupes` Written in C programming language <https://github.com/adrianlopezroche/fdupes>.
* `jdupes` Written in C programming language <https://github.com/jbruchon/jdupes>.
* `rdfind` Written in C++ programming language <https://github.com/pauldreik/rdfind>.
* `rmlint` Written in C programming language <https://github.com/sahib/rmlint>.
* https://github.com/justinhj/justinhj-emacs-utils emacs dired
* http://justinsboringpage.blogspot.ru/2011/06/finding-duplicate-files-in-dired-buffer.html emacs dired
* https://www.emacswiki.org/emacs/RemoveDuplicateFiles emacs dired

## Mount cdrom

    blkid
    mount /dev/sr0 path/to/mnt

## Mount raw disk image (ext3, ext4 and so on)

<https://askubuntu.com/questions/69363/mount-single-partition-from-image-of-entire-disk-device#69447>

Get the sector size and the sector start of the partition:

    # fdisk -lu path/to/image.raw
    Disk path/to/image.raw: 90 GiB, 96636764160 bytes, 188743680 sectors
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disklabel type: dos
    Disk identifier: 0x000b7568
    Device             Boot Start       End   Sectors Size Id Type
    path/to/image.raw1       2048     63487     61440  30M 82 Linux swap / Solaris
    path/to/image.raw2 *    63488 188743678 188680191  90G 83 Linux

Calculate the offset from the start of the image to the partition start
multiplying sector size to sector start: `512 * 63488 = 32505856`

Mount partition on loop devices:

    losetup -o 32505856 /dev/loop0 path/to/image.raw

Mount partition on file system:

    mount /dev/loop0 /mnt/image_raw

## fdupes find duplicate files

<https://github.com/adrianlopezroche/fdupes>,
<https://unix.stackexchange.com/questions/71176/find-duplicate-files#71178>

    fdupes --recurse .

## fslint find duplicate files

<https://unix.stackexchange.com/questions/71176/find-duplicate-files#71201>

    /usr/share/fslint/fslint/findup ./

## Check disk

Check/clean disk after reboot

    touch /forcefsck

## USB Win

<https://askubuntu.com/questions/1281698/what-is-the-best-way-to-format-a-usb-stick-such-that-it-can-be-used-with-both-li#1281771>

    fdisk /dev/sda
    n
    t 7
    mkfs.exfat /dev/sda1

## Other

    bchunk Dungeon_Keeper.BIN Dungeon_Keeper.cue Dungeon_Keeper.iso
    modprobe loop && mount -t iso9660 -o loop tmp/fdfullcd.iso mnt/iso
    mount -t vfat /dev/sdc1 mnt/usbdisk/ \
          -o uid=danil,gid=danil,nosuid,shortname=mixed,umask=077
    mount -t ext2 ~/restore.img /mnt/img -o ro,loop,offset=32256
    mount -t cifs "//192.168.91.3/store (e)" mnt/black_server/ \
          -o "workgroup=darout,username=danil,iocharset=utf8,codepage=cp1251"
    mount --rbind olddir newdir
    fsck /dev/sdg1
