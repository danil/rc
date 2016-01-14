<!-- -*- coding: utf-8; -*- -->

# SSD

## TRIM

Verify support and trim

<https://wiki.archlinux.org/index.php/Solid_State_Drives#Verify_TRIM_Support>
<http://wiki.gentoo.org/wiki/SSD>

    hdparm -I /dev/sda | grep TRIM
    fstrim --verbose /
