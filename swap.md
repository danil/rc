# Swap

# File

<https://wiki.archlinux.org/index.php/swap#Swap_file>

_Sleep/suspend/hibernate to disk do NOT work by default with file swap_

## Create file

    fallocate --length=4GB /path/to/swap

or

    dd if=/dev/zero of=/swapfile bs=1M count=4000

## Swappiness

<https://en.wikipedia.org/wiki/Swappiness>

    sysctl --all | grep swappiness

### Disable

A low value causes the kernel to avoid swapping

    echo 0 > /proc/sys/vm/swappiness

### Enable

Higher value causes the kernel to try to use swap space

    echo 100 > /proc/sys/vm/swappiness

## Other

    chmod 600 /path/to/swap && mkswap /path/to/swap && swapon /path/to/swap

## Partition

<https://wiki.archlinux.org/index.php/swap#Swap_partition>

    mkswap /dev/sda3 && swapon /dev/sda3
    swapon -s
    swapoff -a
