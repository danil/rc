systemd
=======

List
----

<https://wiki.archlinux.org/index.php/systemd#Analyzing_the_system_state>

    systemctl list-unit-files
    systemctl list-units

Start/stop
----------

    systemctl start my-unit-name
    systemctl stop my-unit-name

Reload units
------------

<https://wiki.archlinux.org/index.php/systemd#Editing_provided_unit_files>

    systemctl daemon-reload
