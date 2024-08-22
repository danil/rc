# [Debian][]/[Ubuntu][] <sup><sub>[APT][] based distribution</sub></sup> rc

[apt]: https://en.wikipedia.org/wiki/APT_(software)
[debian]: https://github.com/debian
[ubuntu]: https://github.com/ubuntu

* HOWTO Get version `cat /etc/os-release`
* HOWTO Packages list `apt list --installed`

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

    passwd your-user-nm

## Password delete

    passwd --delete your-user-nm

## HOWTO `dpkg-query --listfiles your_pkg_nm` List files from installed package <sup><sub>Find out files belongs to package. [1545327982][]</sub></sup>

[1545327982]: https://askubuntu.com/questions/32507/how-do-i-get-a-list-of-installed-files-from-a-package#32509

## Find package a file belongs to <sup><sub>[2039225453][]</sub></sup>

    dpkg --search path/to/file
    apt-file search path/to/file

[2039225453]: https://superuser.com/questions/10997/find-what-package-a-file-belongs-to-in-ubuntu-debian#11003

## Find out what package contains a file <sup><sub>[2371447947][] [4187406413][]</sub></sup>

    dpkg -S path/to/your/file
    apt-file update
    apt-file search path/to/your/file

[2371447947]: https://cyberciti.biz/faq/equivalent-of-rpm-qf-command
[4187406413]: http://debian-administration.org/articles/334

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

## Setup/configure X11 locales

    dpkg-reconfigure xserver-xorg locales

## Create bootable USB

Install `usb-creator-gtk` or `mkusb-nox` (https://launchpad.net/~mkusb/+archive/ubuntu/ppa)
