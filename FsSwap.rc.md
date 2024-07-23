# Swap rc

* HOWTO `swapon --summary`
* HOWTO Get size `free --human | grep Swap`
* HOWTO Disable  `swapoff /swap.img` || `swapoff --all`
* HOWTO Enable   `swapon /swap.img`

## HOWTO Create file by `dd` <sup><sub>sleep/suspend/hibernate to disk do **NOT** work by default with file swap [2976221903][]</sub></sup>

    dd if=/dev/zero of=/swap.img bs=1G count=4
    chmod 0600 /swap.img
    mkswap /swap.img
    swapon /swap.img

[2976221903]: https://wiki.archlinux.org/title/swap#Swap_file

## HOWTO

* HOWTO Swappiness `sysctl --all | grep swappiness` <sup><sub>[485532627][]</sub></sup>
* HOWTO Swappiness disable `sysctl --write vm.swappiness=0` | `echo 0 > /proc/sys/vm/swappiness` <sup><sub>A low value causes the kernel to avoid swapping</sub></sup>.
* HOWTO Swappiness enable `sysctl --write vm.swappiness=100` | `echo 100 > /proc/sys/vm/swappiness` <sup><sub>Higher value causes the kernel to try to use swap space</sub></sup>.
* HOWTO Partition `mkswap /dev/sda3 && swapon /dev/sda3` <sup><sub>[268679158][]</sub></sup>
* FAIL HOWTO Create file fallocate `fallocate --length=4GB /swap.img` <sup><sub>File created by fallocate do **NOT** work [2771094678][].</sub></sup>

[268679158]: https://wiki.archlinux.org/title/swap#Swap_partition
[2771094678]: https://unix.stackexchange.com/questions/294600/i-cant-enable-swap-space-on-centos-7#answer-294605
[485532627]: https://en.wikipedia.org/wiki/Swappiness
