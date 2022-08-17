# SSH

    ssh -t root@santaslittlehelper "ssh danil@homer"
    sshfs -p 61022 your.tld:/home/danil/ mnt/example_org/

## Key authentication

<https://help.github.com/articles/generating-ssh-keys/#step-2-generate-a-new-ssh-key>

    ssh-keygen -t rsa -C "your.email@your.tld"

## Generate private and public keys

<http://superuser.com/questions/585429/can-i-change-the-filename-of-my-ssh-public-private-key-pair>

    ssh-keygen -f path/to/private_key

## Generate public key by private key

<http://serverfault.com/questions/52285/create-a-public-ssh-key-from-the-private-key#52287>

    ssh-keygen -f path/to/private_key -y > path/to/public_key

## Generate fingerprint by public key

<https://stackoverflow.com/questions/9607295/how-do-i-find-my-rsa-key-fingerprint#9607373>

    ssh-keygen -E md5 -lf path/to/public_key

## Copy public key to remote host

    ssh-copy-id -i ~/.ssh/key-file-name.pub -p54321 anonymous@your.tld

## Get server key

Set `~/.ssh/known_hosts` or `/etc/ssh/ssh_known_hosts`

    ssh-keyscan -t rsa your.tld > /etc/ssh/ssh_known_hosts

## One hop tunnel

<http://revsys.com/writings/quicktips/ssh-tunnel.html>

    ssh -N -L local_port:remote_ip:remote_port -p ssh_port ssh_user@ssh_host
    nc 127.0.0.1 local_port

## Tunnel with release terminal

    ssh -f -N -L local_port:remote_ip:remote_port user@host

## Two hops tunnel

    ssh -N -L 127.0.0.1:local_port:ip_available_from_ssh_host:remote_port \
        -p ssh_port ssh_user@ssh_host

## Proxy all HTTP traffic over tunnel

* <http://security.stackexchange.com/questions/31226/how-can-i-tunnel-through-an-ssh-server-for-application-layer-protocols-such-as-h#31228>
* <https://en.wikipedia.org/wiki/SOCKS#SOCKS5>

    ssh -D your_local_port -N your_remote_ssh_host

## Forward port to localhost over tunel

<http://askubuntu.com/questions/444729/redirect-port-80-to-8080-and-make-it-work-on-local-machine#444737>

    ssh -gNL 80:127.0.0.1:8080 your_usr@localhost

## Reverse tunneling on localhost

<http://tunnelsup.com/raspberry-pi-phoning-home-using-a-reverse-remote-ssh-tunnel>

    ssh -N -R localhost:remote_port:localhost:local_port your_usr@your.tld

## Reverse tunneling on remote server

    # if you tunnel ssh
    ssh -l your_usr -p remote_port localhost
    # or if you tunnel http
    curl localhost:remote_port

## Agent authentication

    eval `ssh-agent -s`
    ssh-add ~/.ssh/id_rsa
    ssh your@your.tld

## Transparent multi-hop SSH agent forwarding

<http://stackoverflow.com/questions/17846529/could-not-open-a-connection-to-your-authentication-agent#17695338>
<http://sshmenu.sourceforge.net/articles/transparent-mulithop.html>

    eval `ssh-agent`
    ssh-add *pem
    ssh -A -t -p 9922 medapp2.waveaccess.ru ssh -A danil@192.168.0.38

## Tail -f

`tail -f` command over ssh
<https://serverfault.com/questions/1669/shell-command-to-monitor-changes-in-a-file-whats-it-called-again/1670#1670>

    ssh your_usr@your_usr@your.tld "tail -f path/to/your.log"
