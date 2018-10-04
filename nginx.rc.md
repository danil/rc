# nginx

## Config

### reload

    kill -HUP `cat /usr/local/nginx/logs/nginx.pid`

### Test

    nginx -t -c path/to/nginx.conf
