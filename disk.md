# Disk

# Validate

Validate fstab syntax
<http://serverfault.com/questions/174181/how-do-you-validate-fstab-without-rebooting#509014>.

    mount --verbose --all --fake

# Formatting

## mke2fs

    mkfs.ext2 -L fs_boot /dev/sde1
    mkfs.vfat -F 32 /dev/sdg1

### Set number of inodes

    mkfs.ext4 -N 1000432 /dev/sda5

<http://stackoverflow.com/questions/3618820/how-many-bytes-per-inodes>.

    tune2fs -l /dev/sda5 | grep Inode

# Free/used space

    df -hi

## Finding largest files/directories

* <http://superuser.com/questions/9847/linux-utility-for-finding-the-largest-files-directories>
* <http://cyberciti.biz/faq/how-do-i-find-the-largest-filesdirectories-on-a-linuxunixbsd-filesystem/>
* <http://cyberciti.biz/faq/find-large-files-linux/>

    du -hx ./ | grep -E ^[0-9.,]+[MG]
    find  -ctime +30 -daystart -type d \
      | xargs du -b 2>/dev/null \
      | awk '{total += $1; print $0} END{print total}'

# Get UUID

<http://unix.stackexchange.com/questions/658/linux-how-can-i-view-all-uuids-for-all-available-disks-on-my-system#660>

    ls -l /dev/disk/by-uuid | grep sda1

# dd

## Copy partition

* <https://wiki.archlinux.org/index.php/Disk_cloning>
* <http://askubuntu.com/questions/173907/when-cloning-ext4-partition-with-the-dd-command-to-a-bigger-partition-free-spa#173968>
* <https://linode.com/docs/migrate-to-linode/disk-images/copying-a-disk-image-to-a-different-account#copying-the-disk-image>

    dd if=/dev/your-source1 of=/dev/your-destination1 bs=512 conv=sync

### Free free space

    resize2fs /dev/sda99

## Create ISO

Copy from cd-rom disc to ISO image

    dd if=/dev/cdrom of=myimage.iso

## Create usb

Copy ISO image to bootable usb

    dd if=path/to/your.iso of=/dev/your-usb

## Other

    dd if=/dev/sdb of=mybackup.img bs=130M count=1
    dd if=bootldr.rom of=/dev/sdb
    dd if=debian-eeepc.img of=/dev/sdf

# Free space

`sys-fs/ncdu` Diskspace a-la usage is an baobab and gt5 replacement

# lsof

Find and close process/program wich open removed files.
Space will not be freed until they are closed.
<http://unix.stackexchange.com/questions/34140/tell-fs-to-free-space-from-deleted-files-now#34143>

    lsof | grep deleted

# Other

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
