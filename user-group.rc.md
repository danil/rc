# User/Group

## User add

    useradd --uid=1000 \
            --gid=1000 \
            --comment="Your user name" \
            --user-group \
            --groups=your,groups,names \
            --create-home \
            --home-dir=/path/to/home/your_usr \
            --shell=/bin/bash \
            your_usr

## Add user and group with the same name

    useradd --user-group your_usr_and_group

## Add no login/unprivileged user

    useradd --system \
            --comment="Your daemon/proces user name"\
            --user-group=your_usr
            --home-dir=/dev/null
            --shell=/sbin/nologin \
            your_usr

## User edit

    usermod --comment "Your user name" \
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

    groupmod -n new_group_name your_grp

## Group remove

    groupdel your_grp
    delgroup --only-if-empty your_grp

## Add to group

    gpasswd --add your_usr your_grp && newgrp
    usermod --append --groups=your_grp your_usr

## Group other

    grpck
