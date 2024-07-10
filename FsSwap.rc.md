# Swap rc

    swapon --summary

## HOWTO Get size

    free --human | grep Swap

## HOWTO Disable

    swapoff /path/to/swap.img
    swapoff --all

## HOWTO Enable

    swapon /path/to/swap.img

## HOWTO Create file by `dd` <sup><sub>sleep/suspend/hibernate to disk do **NOT** work by default with file swap [2976221903][]</sub></sup>

    dd if=/dev/zero of=/path/to/swap.img bs=1M count=4000
    chmod 0600 /path/to/swap.img
    mkswap /path/to/swap.img
    swapon /path/to/swap.img

[2976221903]: https://wiki.archlinux.org/title/swap#Swap_file

## HOWTO Create file fallocate <sup><sub>file created by fallocate do **NOT** work [2771094678][]</sub></sup>

    fallocate --length=4GB /path/to/swap.img

[2771094678]: https://unix.stackexchange.com/questions/294600/i-cant-enable-swap-space-on-centos-7#answer-294605

## HOWTO Swappiness <sup><sub>[485532627][]</sub></sup>

    sysctl --all | grep swappiness

[485532627]: https://en.wikipedia.org/wiki/Swappiness

## HOWTO Swappiness disable

A low value causes the kernel to avoid swapping

    sysctl --write vm.swappiness=0

or

    echo 0 > /proc/sys/vm/swappiness

## HOWTO Swappiness enable

Higher value causes the kernel to try to use swap space

    sysctl --write vm.swappiness=100

or

    echo 100 > /proc/sys/vm/swappiness

## HOWTO Partition <sup><sub>[268679158][]</sub></sup>

    mkswap /dev/sda3 && swapon /dev/sda3

[268679158]: https://wiki.archlinux.org/title/swap#Swap_partition
