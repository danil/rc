# Linux OS rcc

## HOWTO Get local IP <sup>[4031451098][]</sup>

    sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
    hostname -I | cut -d' ' -f1

[4031451098]: https://stackoverflow.com/questions/13322485/how-to-get-the-primary-ip-address-of-the-local-machine-on-linux-and-os-x

## HOWTO hostname: Get host name only

    hostname

## HOWTO hostname: Get FQDN (full qualified domain name) <sup>domain name and host name</sup>

    hostname --fqdn
    hostname --long