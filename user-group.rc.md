# User/Group

## User add

    useradd --uid=1000 \
            --gid=1000 \
            --comment="Your user name" \
            --user-group \
            --groups=your,groups,names \
            --create-home \
            --home-dir=/path/to/home/your_user \
            --shell=/bin/bash \
            your_user
    useradd -D

## Add no login/unprivileged user

    useradd --system \
            --comment="Your daemon/proces user name"\
            --user-group=your_user
            --home-dir=/dev/null
            --shell=/sbin/nologin \
            your_user

## User edit

    usermod --comment "Your user name" \
            --home /path/to/user/dir --move-home \
            --user-group --groups your,groups,names --append \
            --shell /bin/bash \
            --gid your_user --login your_user your_user

## User remove

    userdel --remove your_user

## Group list

    groups your_user

## Group create

    groupadd --gid=1000 your_group

## Group edit

    groupmod -n new_group_name your_group

## Group remove

    groupdel your_group
    delgroup --only-if-empty your_group

## Add to group

    gpasswd --add your_user your_group && newgrp

## Group other

    grpck
