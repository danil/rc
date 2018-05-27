# SSD

## SMART

* <https://wiki.gentoo.org/wiki/Smartmontools>
* <https://wiki.archlinux.org/index.php/S.M.A.R.T.>
* <https://en.wikipedia.org/wiki/S.M.A.R.T.>

Porvided by `sys-apps/smartmontools`

### Availability

    smartctl -i /dev/sda

### Health status

    smartctl -H /dev/sda
    smartctl -A /dev/sda
    smartctl -c /dev/sda

### Run test

    smartctl -t TEST /dev/sda

### Print log

    smartctl -l LOG /dev/sda

## TRIM

Verify support and trim

* <https://wiki.archlinux.org/index.php/Solid_State_Drives#Verify_TRIM_Support>
* <http://wiki.gentoo.org/wiki/SSD>
* <https://unix.stackexchange.com/questions/218076/ssd-how-often-should-i-do-fstrim#218083>

    hdparm -I /dev/sda | grep TRIM
    fstrim --verbose /
