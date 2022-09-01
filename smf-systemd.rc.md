# systemd rc

Service Management Facility

## Install requirements

Linux kernel config options: <https://github.com/systemd/systemd/blob/master/README>

## Hostname get

    hostnamectl

## Hostname set

<https://wiki.archlinux.org/index.php/Network_configuration#Set_the_hostname>

    echo your-host-nm > /etc/hostnm
    hostnmctl set-hostnm your-host-nm

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

    systemctl show your_unit_nm
    systemctl status your_unit_nm

## Unit start/stop

Start/stop/restart/reload

    systemctl start your_unit_nm
    systemctl stop your_unit_nm
    systemctl restart your_unit_nm
    systemctl reload your_unit_nm

## Autorun units list

    systemctl list-unit-files | grep enabled

## Unit autorun enable/disable

Start/stop (enable/disable) on system boot/start

    systemctl enable your_unit_nm
    systemctl disable your_unit_nm
    systemctl is-enabled your_unit_nm

## Unit mask/unmask

Completely mask/unmask (enable/disable)

    systemctl mask your_unit_nm
    systemctl unmask your_unit_nm

## Unit reload

<https://wiki.archlinux.org/index.php/systemd#Editing_provided_unit_files>

    systemctl daemon-reload

## X11 restart

<https://askubuntu.com/questions/1220/how-to-restart-x-window-server-from-command-line#1222>

    systemctl restart display-manager