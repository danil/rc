# iptables

iptables rules

## List

    iptables --list
    iptables --list-rules
    ip6tables --list
    ip6tables --list-rules

## Restore

    iptables-restore < path/to/v4.rules
    ip6tables-restore < path/to/v6.rules

## Other

    iptables -t nat -A POSTROUTING -o eth0 \
             -s 192.168.0.202/32 -j MASQUERADE
