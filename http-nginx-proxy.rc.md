# nginx rcc

## Config reload

    kill -HUP `cat /usr/local/nginx/logs/nginx.pid`

## Config test

    nginx -t -c path/to/nginx.conf

## Let's Encrypt certbot install

For example in Arch install `certbot-nginx` package
https://wiki.archlinux.org/index.php/Certbot#Installation

## Let's Encrypt certbot configure

https://wiki.archlinux.org/index.php/Certbot#Nginx

    certbot --nginx

## Let's Encrypt certbot configure automatic renewal by systemd

https://wiki.archlinux.org/index.php/Certbot#systemd

## Linux

Efficient connection processing method used on Linux 2.6+

    events { use epoll; }

## FreeBSD/OpenBSD/NetBSD/DragonFly BSD

Efficient connection processing method used on FreeBSD 4.1+, OpenBSD 2.9+, NetBSD 2.0

    events { use kqueue; }
