# SCP

    scp path/to/file1 path/to/file2 your_user@your.domain:/path/to/directory
    scp file.tar.gz your_user@your.domain:/path/to/directory
    scp -r path/to/directory your_user@your.domain:/path/to/directory

# SSH

    ssh -t root@santaslittlehelper "ssh danil@homer"
    sshfs -p 61022 example.org:/home/danil/ mnt/example_org/

## Key authentication

<https://help.github.com/articles/generating-ssh-keys/#step-2-generate-a-new-ssh-key>

    ssh-keygen -t rsa -C "your.email@example.org"

### Generate private and public keys

<http://superuser.com/questions/585429/can-i-change-the-filename-of-my-ssh-public-private-key-pair>

    ssh-keygen -f path/to/private_key

### Generate public key by private key

<http://serverfault.com/questions/52285/create-a-public-ssh-key-from-the-private-key#52287>

    ssh-keygen -f path/to/private_key -y > path/to/public_key

### Generate fingerprint by public key

<https://stackoverflow.com/questions/9607295/how-do-i-find-my-rsa-key-fingerprint#9607373>

    ssh-keygen -E md5 -lf path/to/public_key

### Copy public key to remote host

    ssh-copy-id -i ~/.ssh/key-file-name.pub -p54321 anonymous@example.org

### Get server key

Set `~/.ssh/known_hosts` or `/etc/ssh/ssh_known_hosts`

    ssh-keyscan -t rsa example.org > /etc/ssh/ssh_known_hosts

## Tunneling

### SSH

<http://revsys.com/writings/quicktips/ssh-tunnel.html>

#### One hop

    ssh -N -L local_port:remote_ip:remote_port -p ssh_port ssh_user@ssh_host
    nc 127.0.0.1 local_port

##### Release terminal

    ssh -f -N -L local_port:remote_ip:remote_port user@host

#### Two hops

    ssh -N -L 127.0.0.1:local_port:ip_available_from_ssh_host:remote_port \
        -p ssh_port ssh_user@ssh_host

#### Proxy all HTTP traffic

* <http://security.stackexchange.com/questions/31226/how-can-i-tunnel-through-an-ssh-server-for-application-layer-protocols-such-as-h#31228>
* <https://en.wikipedia.org/wiki/SOCKS#SOCKS5>

```sh
ssh -D your_local_port -N your_remote_ssh_host
```

#### Forward port on localhost

<http://askubuntu.com/questions/444729/redirect-port-80-to-8080-and-make-it-work-on-local-machine#444737>

    ssh -gNL 80:127.0.0.1:8080 your_user@localhost

#### Reverse tunneling

<http://tunnelsup.com/raspberry-pi-phoning-home-using-a-reverse-remote-ssh-tunnel>

##### On localhost

    ssh -N -R localhost:remote_port:localhost:local_port your_user@example.org

##### On remote server

```sh
# if you tunnel ssh
ssh -l your_user -p remote_port localhost
# or if you tunnel http
curl localhost:remote_port
```

## Transparent multi-hop SSH agent forwarding

<http://stackoverflow.com/questions/17846529/could-not-open-a-connection-to-your-authentication-agent#17695338>
<http://sshmenu.sourceforge.net/articles/transparent-mulithop.html>

    eval `ssh-agent`
    ssh-add *pem
    ssh -A -t -p 9922 medapp2.waveaccess.ru ssh -A danil@192.168.0.38

## Tail -f

`tail -f` command over ssh
<https://serverfault.com/questions/1669/shell-command-to-monitor-changes-in-a-file-whats-it-called-again/1670#1670>

    ssh your_user@your_user@example.org "tail -f path/to/your.log"

## Audit

`net-analyzer/ssh-audit` <https://github.com/arthepsy/ssh-audit>

    ssh-audit example.org

# SSL

## Audit

SSL/HTTPS checker: <https://www.ssllabs.com/ssltest/analyze.html>