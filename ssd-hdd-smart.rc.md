# SSD/HDD

## SSD TRIM

Verify support and trim

* <https://wiki.archlinux.org/index.php/Solid_State_Drives#Verify_TRIM_Support>
* <http://wiki.gentoo.org/wiki/SSD>
* <https://unix.stackexchange.com/questions/218076/ssd-how-often-should-i-do-fstrim#218083>

    hdparm -I /dev/sda | grep TRIM
    fstrim --verbose /

## SMART availability

    smartctl -i /dev/sda

## SMART health status

    smartctl -H /dev/sda
    smartctl -A /dev/sda
    smartctl -c /dev/sda
    smartctl -H /dev/sda \
      | grep overall-health \
      | awk 'match($0,"result:"){print substr($0,RSTART+8,6)}'

## Run SMART test

    smartctl -t TEST /dev/sda

## Print SMART log

    smartctl -l LOG /dev/sda
