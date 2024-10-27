# [systemd][] <sup><sub>Service Management Facility</sub></sup> rc

[systemd]: https://github.com/systemd/systemd

## Install

Require the Linux kernel config options `CONFIG_DEVTMPFS`, `CONFIG_CGROUPS`
and so on <sup><sub>[1547857926][]</sub></sup>

[1547857926]: https://github.com/systemd/systemd/blob/main/README

## HOWTO Hostname get

    hostnamectl

## HOWTO Hostname set <sup><sub>[3184402845][]</sub></sup>

    echo your-host-nm > /etc/hostnm
    hostnmctl set-hostnm your-host-nm

[3184402845]: https://wiki.archlinux.org/title/Network_configuration#Set_the_hostname

## HOWTO Time/NTP get status <sup><sub>[3435016567][]</sub></sup>

    timedatectl

[3435016567]: https://wiki.archlinux.org/title/Systemd-timesyncd#Usage

## HOWTO Time enable NTP

    timedatectl set-ntp true

## HOWTO Units list

    systemctl list-unit-files

## HOWTO Running units list <sup><sub>[3742307392][]</sub></sup>

    systemctl status
    systemctl
    systemctl list-units

[3742307392]: https://wiki.archlinux.org/title/systemd#Analyzing_the_system_state

## HOWTO Failed units list

    systemctl --failed

## HOWTO Unit status show <sup><sub>service info</sub></sup>

    systemctl show your_unit_nm
    systemctl status your_unit_nm

## HOWTO Unit start/stop <sup><sub>restart/reload</sub></sup>

    systemctl start your_unit_nm
    systemctl stop your_unit_nm
    systemctl restart your_unit_nm
    systemctl reload your_unit_nm

## HOWTO Autorun units list

    systemctl list-unit-files | grep enabled

## HOWTO Unit autorun enable/disable <sup><sub>start/stop on system boot/start</sub></sup>

    systemctl enable your_unit_nm
    systemctl disable your_unit_nm
    systemctl is-enabled your_unit_nm

## HOWTO Unit mask/unmask <sup><sub>completely enable/disable</sub></sup>

    systemctl mask your_unit_nm
    systemctl unmask your_unit_nm

## HOWTO Unit reload <sup><sub>[3564854911][]</sub></sup>

    systemctl daemon-reload

[3564854911]: https://wiki.archlinux.org/title/systemd#Editing_provided_unit_files

## HOWTO X11 restart <sup><sub>[640934383][]</sub></sup>

    systemctl restart display-manager

[640934383]: https://askubuntu.com/questions/1220/how-to-restart-x-window-server-from-command-line#1222

## HOWTO journalctl search grep/regexp

    journalctl --unit="your_unit_nm.service" --grep="your.regexp"

## HOWTO journalctl show N lines

    journalctl -n42 --lines=42

## HOWTO journalctl real-time watch/follow

    journalctl -f --follow
