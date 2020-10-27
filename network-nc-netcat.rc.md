# netcat

nc110 <http://nc110.sourceforge.net>

## Get

### http 80

```
printf "GET / HTTP/1.0\r\nHost: your.tld\r\n\r\n" | nc your.tld 443
```

### https 443

```
printf "GET / HTTP/1.0\r\nHost: your.tld\r\n\r\n" | nc your.tld 443
```

## Other

<https://en.wikipedia.org/wiki/Netcat>

    echo "alpha bravo charlie delta" | busybox nc localhost 9000
