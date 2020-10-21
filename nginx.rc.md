# nginx

## Config reload

    kill -HUP `cat /usr/local/nginx/logs/nginx.pid`

## Config test

    nginx -t -c path/to/nginx.conf
