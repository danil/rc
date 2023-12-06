# [netcat][] rc

[netcat]: https://en.wikipedia.org/wiki/Netcat

* [OpenBSD Netcat][]
* [Netcat 1.10][]
* [GNU Netcat][]

[gnu netcat]: https://netcat.sourceforge.net
[netcat 1.10]: http://nc110.sourceforge.net
[openbsd netcat]: https://github.com/openbsd/src/blob/master/usr.bin/nc/netcat.c

## Install [GNU Netcat][]

    brew install netcat

## Install [OpenBSD Netcat][]

    apt install netcat-openbsd

## HTTP 80

    printf "GET / HTTP/1.0\r\nHost: your.tld\r\n\r\n" | nc your.tld 80

## HTTPS 443

    printf "GET / HTTP/1.0\r\nHost: your.tld\r\n\r\n" | nc your.tld 443

## Busybox

    echo "alpha bravo charlie delta" | busybox nc your.tld 80
