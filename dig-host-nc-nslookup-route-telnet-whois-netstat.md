# Network

    ngrep -d lo | less

# Set up interface

<http://simms-teach.com/howtos/basic-network-config.html>

    ifconfig eth0 192.168.0.3 netmask 255.255.255.0

# Name

Domain name and host name

## Get only host name

    hostname

## Get full domain name

Full qualified domain name

    hostname --fqdn
    hostname --long

## Get tld name

Top level domain name

    dnsdomainname

# Gateway

## Get

Find out gateway <http://cyberciti.biz/faq/how-to-find-gateway-ip-address>

    route | grep UG

## Set

    route add default gw 192.168.0.1

# Set DNS

    echo 'nameserver 192.168.0.2' > /etc/resolv.conf

# Used ports

<http://askubuntu.com/questions/278448/how-to-know-what-program-is-listening-on-a-given-port#278455>

    netstat -taupen

# Remote shell

    telnet mail.omskportal.ru 25

# Telnet

    busybox telnet example.org 22

# Nmap

Find/discover/scanning hosts and services on a computer network
<https://security.stackexchange.com/questions/36198/how-to-find-live-hosts-on-my-network#36200>

    nmap --open 217.197.232.218
    nmap -sP 192.168.0.0/16
    nmap -sP 192.168.2.1/24
    
# dig

## DNS

List all DNS records, ns (name servers) and so on

    dig example.org ANY

# Netcat

nc110 <http://nc110.sourceforge.net>

## Test connection

Ensure that web server respond on 80 port

    nc -vz localhost 80

# Traceroute

<https://en.wikipedia.org/wiki/Traceroute>

    traceroute example.org

## Other

<https://en.wikipedia.org/wiki/Netcat>

    echo "alpha bravo charlie delta" | busybox nc localhost 9000

# host

Get `A` and `MX` records

    host example.org your.dns.server.org

# Other

    rtorrent -s ./.rtorrent
    nslookup 172.16.81.4
    whois example.org
    ifconfig -a
    ifconfig eth0.1 hw ether 00:1D:7E:55:19:D9
    dhclient
    ip r
    route del default gw 192.168.28.1 ath0
    route {add|del} [default] [gw 192.168.0.1] -net 172.16.0.0 \
          netmask 255.255.0.0 dev ppp0
    echo "1" > /proc/sys/net/ipv4/ip_forward
    pon darout
    poff darout
    iwlist ath0 scanning
    iwconfig ath0 essid John
    iwconfig ath0 key s:dfvgbh1234567
    killall wpa_supplicant && sleep 5 \
     && wpa_supplicant -i ath0 -c /etc/wpa_supplicant/wpa_supplicant.conf
    wvdial megafon
    curlftpfs -o "user=danil" example.org mnt/example_org/
    smbtree [-N] -d 2
    smbclient [-N] -L server
    smbclient -N "\\\\server\\store (e)"
    smbmount "//172.16.84.14/d$" mnt/cdp0002 \
     -o workgroup=darout,username=your_user_name,iocharset=UTF-8,codepage=windows-1251
    rdesktop -g 99% -k en 192.168.91.5
