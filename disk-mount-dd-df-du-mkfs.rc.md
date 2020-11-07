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

```sh
mkfs.vfat -F 32 /dev/sdg1
```

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

## Duplicate file find

1. `ddh` written in rust programming language https://github.com/darakian/ddh
2. https://github.com/justinhj/justinhj-emacs-utils emacs dired
3. http://justinsboringpage.blogspot.ru/2011/06/finding-duplicate-files-in-dired-buffer.html emacs dired
4. https://www.emacswiki.org/emacs/RemoveDuplicateFiles emacs dired

## Mount cdrom

    blkid
    mount /dev/sr0 path/to/mnt

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
