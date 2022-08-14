# route

Gateway

## Get

Find out gateway <http://cyberciti.biz/faq/how-to-find-gateway-ip-address>

    route | grep UG

## Set

    route add default gw 192.168.0.1

## Other

    route del default gw 192.168.28.1 ath0
    route {add|del} [default] [gw 192.168.0.1] -net 172.16.0.0 \
          netmask 255.255.0.0 dev ppp0
