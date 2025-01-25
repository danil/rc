# User/group rc

* HOWTO Add user `useradd --uid=1000 --gid=1000 --comment="Your user nm" --user-group --groups=your,groups,names --create-home --home-dir=/path/to/home/your_usr --shell=/bin/bash your_usr`
* HOWTO UID VER2 `ls -n --numeric-uid-gid path/to/your/file` <sup><sub>Get user identifier by file name. [POSIX UID][3814734741]</sub></sup>
* HOWTO UID VER1 `id -u --user your_usr_nm`                  <sup><sub>Get user identifier by user name. [1791636291][]</sub></sup>

[1791636291]: https://askubuntu.com/questions/468236/how-can-i-find-my-user-id-uid-from-terminal#468239
[3814734741]: https://en.wikipedia.org/wiki/User_identifier

## Add user and group with the same name

    useradd --user-group your_usr_and_grp

## Add no login/unprivileged user

    useradd --system \
            --comment="Your daemon/proces user nm"\
            --user-group=your_usr
            --home-dir=/dev/null
            --shell=/sbin/nologin \
            your_usr

## User edit

    usermod --comment "Your user nm" \
            --home /path/to/user/dir --move-home \
            --user-group --groups your,groups,names --append \
            --shell /bin/bash \
            --gid your_usr --login your_usr your_usr

## Adding user to multiple groups

    usermod --append --groups=your_grp1,your_grp2 your_usr

## User remove

    userdel --remove your_usr

## User other

    useradd -D

## Group list

    groups your_usr

## Group create

    groupadd --gid=1000 your_grp

## Group edit

    groupmod -n new_grp_name your_grp

## Group remove

    groupdel your_grp
    delgroup --only-if-empty your_grp

## Add to group

    gpasswd --add your_usr your_grp && newgrp
    usermod --append --groups=your_grp your_usr

## Group other

    grpck
