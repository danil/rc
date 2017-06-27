# APT based distributions

Distributions like Ubuntu/Debian

## Runlevels

`/etc/init.d` (https://wiki.debian.org/RunLevel)

### List

List all services by run levels

    ls /etc/rc*.d

### Status

    service your_daemon status

### Start

    service your_daemon start

### Stop

    service your_daemon stop

### Add

    update-rc.d your_daemon defaults

### Remove

    update-rc.d -f your_daemon remove

## Users

### Add

    useradd -D
    useradd --comment "Your user name" \
            --user-group --groups your,groups,names \
            --create-home --base-dir /path/to/user/dir \
            --shell /bin/bash your_user

### Edit

    usermod --comment "Your user name" \
            --home /path/to/user/dir --move-home \
            --user-group --groups your,groups,names --append \
            --shell /bin/bash \
            --gid your_user --login your_user your_user

### Remove

    deluser --remove-all-files --backup --backup-to path/to/backup your_user
    userdel --remove your_user

## Groups

### List

    groups your_user

### Create

    groupadd your_group

### Edit

    groupmod -n new_group_name your_group

### Remove

    groupdel your_group
    delgroup --only-if-empty your_group

### Add to group

    gpasswd --add your_user your_group #and then `newgrp`

### Other

    grpck

## Passwords

### Set

    passwd your-user-name

### Delete

    passwd --delete your-user-name

## APT (Advanced Packaging Tool)

### Repository

#### Add

    add-apt-repository ppa:indicator-brightness/ppa
    apt-get update

#### Remove

    add-apt-repository --remove ppa:indicator-brightness/ppa
    apt-get update

### Finding which package contains a file

<http://debian-administration.org/articles/334>

    apt-file update
    apt-file search /usr/bin/ag

### Other

    apt-get update
    apt-get --show-upgraded upgrade
    apt-get --show-upgraded dist-upgrade
    apt-cash [--full] search emacs
    apt-cash show emacs
    apt-cache depends penguin-command
    apt-get --target-release testing install emacs22-nox
    apt-get --purge remove xyz
    apt-get clean
    apt-cdrom [--cdrom /home/danil/mnt/cdrom] add
    apt-key add archive-key-eeepc.asc
    apt-mark unmarkauto
    reprepro
    wget --output-document=- http://backports.org/debian/archive.key \
      | apt-key add -

## dpkg-query

### List files from package

List files from installed package
<https://askubuntu.com/questions/32507/how-do-i-get-a-list-of-installed-files-from-a-package#32509>

    dpkg-query --listfiles your_package_name

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
    gpasswd --add your_user superusers
