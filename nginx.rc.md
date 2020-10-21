# nginx

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
