# SSD/HDD SMART

* <https://wiki.gentoo.org/wiki/Smartmontools>
* <https://wiki.archlinux.org/index.php/S.M.A.R.T.>
* <https://en.wikipedia.org/wiki/S.M.A.R.T.>

Porvided by `sys-apps/smartmontools`

## Availability

    smartctl -i /dev/sda

## Health status

    smartctl -H /dev/sda
    smartctl -A /dev/sda
    smartctl -c /dev/sda
    smartctl -H /dev/sda \
      | grep overall-health \
      | awk 'match($0,"result:"){print substr($0,RSTART+8,6)}'

## Run test

    smartctl -t TEST /dev/sda

## Print log

    smartctl -l LOG /dev/sda
