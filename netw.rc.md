# Network rc

## HOWTO Get local IP <sup>[4031451098][]</sup>

    sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
    hostname -I | cut -d' ' -f1

[4031451098]: https://stackoverflow.com/questions/13322485/how-to-get-the-primary-ip-address-of-the-local-machine-on-linux-and-os-x

## HOWTO Get DNS servers am I using?<sup>[782596962][]</sup>

    cat /etc/resolv.conf | grep nameserver
    nslookup your.tld | head -n2

[782596962]: https://unix.stackexchange.com/questions/28941/what-dns-servers-am-i-using

## HOWTO Network host NS/DNS: Get `A` and `MX` records

    host your.tld your.dns.server.tld

## HOWTO Network host NS/DNS: Get name servers

    host -t ns your.tld
