# Swap

# File

<https://wiki.archlinux.org/index.php/swap#Swap_file>

## Create file

    fallocate --length=4GB /path/to/swap

or

    dd if=/dev/zero of=/swapfile bs=1M count=4000

## Other

    chmod 600 /path/to/swap && mkswap /path/to/swap && swapon /path/to/swap

## Partition

<https://wiki.archlinux.org/index.php/swap#Swap_partition>

    mkswap /dev/sda3 && swapon /dev/sda3
    swapon -s
    swapoff -a
