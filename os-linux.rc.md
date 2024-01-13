# Linux OS rcc

## HOWTO hostname: Get host name only

    hostname

## HOWTO hostname: Get FQDN (full qualified domain name) <sup>domain name and host name</sup>

    hostname --fqdn
    hostname --long

## HOWTO hostname: Get local IP <sup>[*][4031451098]</sup>

    hostname -I | cut -d' ' -f1

[4031451098]: https://stackoverflow.com/questions/13322485/how-to-get-the-primary-ip-address-of-the-local-machine-on-linux-and-os-x
