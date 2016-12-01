# Debian/Ubuntu

## Runlevels

`/etc/init.d` (https://wiki.debian.org/RunLevel)

### Add

    update-rc.d your_daemon defaults

### Remove

    update-rc.d -f your_daemon remove

## Change timezone

<https://www.digitalocean.com/community/tutorials/additional-recommended-steps-for-new-ubuntu-14-04-servers#configure-timezones-and-network-time-protocol-synchronization>
<https://www.digitalocean.com/community/questions/how-to-change-the-timezone-on-ubuntu-14>

    dpkg-reconfigure tzdata
