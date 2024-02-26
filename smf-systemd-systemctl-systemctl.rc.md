# [systemd][]<sup>Service Management Facility</sup> rc

[systemd]: https://github.com/systemd/systemd

## Install

Require the Linux kernel config options `CONFIG_DEVTMPFS`, `CONFIG_CGROUPS`
and so on <sup>[1547857926][]</sup>

[1547857926]: https://github.com/systemd/systemd/blob/main/README

## HOWTO Hostname get

    hostnamectl

## HOWTO Hostname set <sup>[3184402845][]</sup>

    echo your-host-nm > /etc/hostnm
    hostnmctl set-hostnm your-host-nm

[3184402845]: https://wiki.archlinux.org/title/Network_configuration#Set_the_hostname

## HOWTO Time/NTP get status <sup>[3435016567][]</sup>

    timedatectl

[3435016567]: https://wiki.archlinux.org/title/Systemd-timesyncd#Usage

## HOWTO Time enable NTP

    timedatectl set-ntp true

## HOWTO Units list

    systemctl list-unit-files

## HOWTO Running units list <sup>[3742307392][]</sup>

    systemctl status
    systemctl
    systemctl list-units

[3742307392]: https://wiki.archlinux.org/title/systemd#Analyzing_the_system_state

## HOWTO Failed units list

    systemctl --failed

## HOWTO Unit status show <sup>service info</sup>

    systemctl show your_unit_nm
    systemctl status your_unit_nm

## HOWTO Unit start/stop <sup>restart/reload</sup>

    systemctl start your_unit_nm
    systemctl stop your_unit_nm
    systemctl restart your_unit_nm
    systemctl reload your_unit_nm

## HOWTO Autorun units list

    systemctl list-unit-files | grep enabled

## HOWTO Unit autorun enable/disable <sup>start/stop on system boot/start</sup>

    systemctl enable your_unit_nm
    systemctl disable your_unit_nm
    systemctl is-enabled your_unit_nm

## HOWTO Unit mask/unmask <sup>completely enable/disable</sup>

    systemctl mask your_unit_nm
    systemctl unmask your_unit_nm

## HOWTO Unit reload <sup>[3564854911][]</sup>

    systemctl daemon-reload

[3564854911]: https://wiki.archlinux.org/title/systemd#Editing_provided_unit_files

## HOWTO X11 restart <sup>[640934383][]</sup>

    systemctl restart display-manager

[640934383]: https://askubuntu.com/questions/1220/how-to-restart-x-window-server-from-command-line#1222
