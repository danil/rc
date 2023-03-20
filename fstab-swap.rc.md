# Swap

    swapon --summary

## Get size

    free --human | grep Swap

## Disable

    swapoff /path/to/swap
    swapoff --all

## Enable

    swapon /path/to/swap

## Create file dd

<https://wiki.archlinux.org/index.php/swap#Swap_file>

Sleep/suspend/hibernate to disk do **NOT** work by default with file swap

    dd if=/dev/zero of=/path/to/swap bs=1M count=4000
    chmod 0600 /path/to/swap
    mkswap /path/to/swap
    swapon /path/to/swap

## Create file fallocate

File created by fallocate do **NOT** work
<https://unix.stackexchange.com/questions/294600/i-cant-enable-swap-space-on-centos-7#answer-294605>

    fallocate --length=4GB /path/to/swap

## Swappiness

<https://en.wikipedia.org/wiki/Swappiness>

    sysctl --all | grep swappiness

## Swappiness disable

A low value causes the kernel to avoid swapping

    sysctl --write vm.swappiness=0

or

    echo 0 > /proc/sys/vm/swappiness

## Swappiness enable

Higher value causes the kernel to try to use swap space

    sysctl --write vm.swappiness=100

or

    echo 100 > /proc/sys/vm/swappiness

## Partition

<https://wiki.archlinux.org/index.php/swap#Swap_partition>

    mkswap /dev/sda3 && swapon /dev/sda3
