# SSD

## TRIM

Verify support and trim

* <https://wiki.archlinux.org/index.php/Solid_State_Drives#Verify_TRIM_Support>
* <http://wiki.gentoo.org/wiki/SSD>
* <https://unix.stackexchange.com/questions/218076/ssd-how-often-should-i-do-fstrim#218083>

    hdparm -I /dev/sda | grep TRIM
    fstrim --verbose /
