# Partitions

# UUIDs and labels

<https://wiki.gentoo.org/wiki/Fstab#UUIDs_and_labels>,
<https://wiki.gentoo.org/wiki/Removable_media#UUIDs_and_labels>

    tree /dev/disk
    lsblk -o +fstype,label,uuid,partuuid

# MBR & GPT

<https://wiki.archlinux.org/index.php/partitioning#Partitioning_tools>

```
                 |       MBR        |       GPT
-----------------+------------------+------------------
                 | fdisk            | fdisk
     Dialog      | parted           | gdisk
                 |                  | parted
-----------------+------------------+------------------
 Pseudo-graphics | cfdisk           | cfdisk
                 |                  | cgdisk
                 | sfdisk           | sfdisk
-----------------+------------------+-------------------
 Non-interactive | parted           | sgdisk
                 |                  | parted
-----------------+------------------+-------------------
    Graphical    | GParted          | GParted
                 | partitionmanager | partitionmanager
```

# lsblk

List partitions:
* <https://wiki.archlinux.org/index.php/persistent_block_device_naming#Persistent_naming_methods>
* <https://wiki.archlinux.org/index.php/fstab#Kernel_name_descriptors>

    lsblk

# GPT

## Copy

<http://unix.stackexchange.com/questions/93385/how-to-restore-the-partition-layout-for-gpt-disk#93391>

Copy partitions table from /dev/sda to /dev/sdb

    sgdisk --replicate=/dev/sdb /dev/sda

### Make unique its GUID as it was cloned and is identical with /dev/sda

    sgdisk --randomize-guids /dev/sdb

## parted

<http://gentoo.org/doc/en/handbook/handbook-amd64.xml?part=1&chap=4>

    parted /dev/sda

### Make GPT

<https://wiki.archlinux.org/index.php/GUID_Partition_Table#parted_basic_.28via_command_line_options.29>

    parted --script /dev/sda mklabel gpt

## gdisk

<https://wiki.archlinux.org/index.php/Partitioning#Partitioning_tools>.

    gdisk /dev/sda

      Name     Flags    Part Type   FS Type            [Label]       Size (MB)
    ---------------------------------------------------------------------------
      sda1     Boot      Primary    Linux ext4         [fs_bios]        100,00
      sda2               Primary    Linux ext4         [fs_boot]       1000,00
      sda3               Primary    Linux swap / Solaris               9000,00
      sda4               Primary    Linux ext4         [fs_root]     109000,00

# MBR

Legacy!

## fdisk & sfdisk

    fdisk -l /dev/sdb
    sfdisk -l -uM

```
  Name     Flags    Part Type   FS Type            [Label]       Size (MB)
---------------------------------------------------------------------------
  sda1     Boot      Primary    Linux ext4         [fs_boot]       1000,00
  sda2               Primary    Linux swap / Solaris               9000,00
  sda3               Primary    Linux ext4         [fs_root]     110000,00
```

# cfdisk

## Warning

<https://wiki.archlinux.org/index.php/Partitioning#Partitioning_tools>.

The first partition created by `cfdisk` starts at sector 63,
instead of the usual 2048. This can lead to reduced performance on _SSD_
and advanced format (4k sector) drives.
It will cause problems with _GRUB2_.
GRUB legacy and Syslinux should work fine.
