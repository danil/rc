# APT based distributions

Distributions like Ubuntu/Debian

## Packages list

    apt list --installed

## Packages explicitly installed list

List manually/explicitly installed packages

```sh
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)
comm -23 <(aptitude search '~i !~M' -F '%p' | sed "s/ *$//" | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)
```

## Runlevels

`/etc/init.d` (https://wiki.debian.org/RunLevel)

## Runlevels list

List all services by run levels
<https://askubuntu.com/questions/698993/disable-services-on-startup-in-ubuntu/699015#699015>

    service --status-all
    ls /etc/rc*.d

## Status on runlevel

    service your_daemon status

## Start on runlevel

    service your_daemon start

## Stop on runlevel

    service your_daemon stop

## Add to runlevel

    update-rc.d your_daemon defaults

## Remove from runlevel

    update-rc.d -f your_daemon remove

## Password set

    passwd your-user-name

## Password delete

    passwd --delete your-user-name

### List files from package

List files from installed package
<https://askubuntu.com/questions/32507/how-do-i-get-a-list-of-installed-files-from-a-package#32509>

    dpkg-query --listfiles your_pkg_name

## Timezone

Change timezone
<https://www.digitalocean.com/community/tutorials/additional-recommended-steps-for-new-ubuntu-14-04-servers#configure-timezones-and-network-time-protocol-synchronization>,
<https://www.digitalocean.com/community/questions/how-to-change-the-timezone-on-ubuntu-14>

    dpkg-reconfigure tzdata

## Sudo without password

<http://askubuntu.com/questions/334318/sudoers-file-enable-nopasswd-for-user-all-commands#answer-574454>

    groupadd superusers
    echo "%superusers ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/001_superusers
    chmod 0440 /etc/sudoers.d/001_superusers
    gpasswd --add your_usr superusers

## Create bootable USB

Install `usb-creator-gtk` or `mkusb-nox` (https://launchpad.net/~mkusb/+archive/ubuntu/ppa)
