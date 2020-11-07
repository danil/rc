# systemd rc

## Install requirements

Linux kernel config options: <https://github.com/systemd/systemd/blob/master/README>

## Hostname get

    hostnamectl

## Hostname set

<https://wiki.archlinux.org/index.php/Network_configuration#Set_the_hostname>

    echo your-host-name > /etc/hostname
    hostnamectl set-hostname your-host-name

## Time/ntp get status

https://wiki.archlinux.org/index.php/Systemd-timesyncd#Usage

    timedatectl

## Time enable ntp

    timedatectl set-ntp true

## Units list

    systemctl list-unit-files

## Running units list

<https://wiki.archlinux.org/index.php/systemd#Analyzing_the_system_state>

    systemctl status
    systemctl
    systemctl list-units

## Failed units list

    systemctl --failed

## Unit status show

Show info about service

    systemctl show your_unit_name
    systemctl status your_unit_name

## Unit start/stop

Start/stop/restart/reload

    systemctl start your_unit_name
    systemctl stop your_unit_name
    systemctl restart your_unit_name
    systemctl reload your_unit_name

## Autorun units list

    systemctl list-unit-files | grep enabled

## Unit autorun enable/disable

Start/stop (enable/disable) on system boot/start

    systemctl enable your_unit_name
    systemctl disable your_unit_name
    systemctl is-enabled your_unit_name

## Unit mask/unmask

Completely mask/unmask (enable/disable)

    systemctl mask your_unit_name
    systemctl unmask your_unit_name

## Unit reload

<https://wiki.archlinux.org/index.php/systemd#Editing_provided_unit_files>

    systemctl daemon-reload
