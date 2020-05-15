# systemd

## Install requirements

Linux kernel config options: <https://github.com/systemd/systemd/blob/master/README>

## List

<https://wiki.archlinux.org/index.php/systemd#Analyzing_the_system_state>

    systemctl list-unit-files
    systemctl list-units

## Show/status

Show info about service

    systemctl show your_unit_name
    systemctl status your_unit_name

## Start/stop

Start/stop/restart/reload

    systemctl start your_unit_name
    systemctl stop your_unit_name
    systemctl restart your_unit_name
    systemctl reload your_unit_name

## Autorun enable/disable

Start/stop (enable/disable) on system boot/start

    systemctl enable your_unit_name
    systemctl disable your_unit_name
    systemctl is-enabled your_unit_name

## Mask/unmask

Completely mask/unmask (enable/disable)

    systemctl mask your_unit_name
    systemctl unmask your_unit_name

## Reload units

<https://wiki.archlinux.org/index.php/systemd#Editing_provided_unit_files>

    systemctl daemon-reload
