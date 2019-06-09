# systemd

## List

<https://wiki.archlinux.org/index.php/systemd#Analyzing_the_system_state>

    systemctl list-unit-files
    systemctl list-units

## Show

Show info about service

    systemctl show your_unit_name

## Start/stop

    systemctl start your_unit_name
    systemctl stop your_unit_name

## Autorun start/stop

Start/stop on system boot/start

    systemctl your_unit_name
    systemctl stop your_unit_name

## Reload units

<https://wiki.archlinux.org/index.php/systemd#Editing_provided_unit_files>

    systemctl daemon-reload
