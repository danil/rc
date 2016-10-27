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

### Generate public key from private key

<http://serverfault.com/questions/52285/create-a-public-ssh-key-from-the-private-key#52287>

    ssh-keygen -f path/to/private_key -y > path/to/public_key

### Copy public key to remote host

    ssh-copy-id -i ~/.ssh/key-file-name.pub "anonymous@example.org -p 2000"

## Tunneling

### SSH

<http://revsys.com/writings/quicktips/ssh-tunnel.html>

    ssh -f -N -L localhost:2000:homer:22 root@stampy
    ssh -p 2000 danil@localhost

### HTTP

#### Release terminal

    ssh -f -N -L localhost:3001:192.168.0.38:3000 medapp
    curl localhost:3001

#### Not release terminal

    ssh -L localhost:3001:192.168.0.38:3000 \
        -p 9922 danil@medapp2.waveaccess.ru

#### Forward port on localhost

<http://askubuntu.com/questions/444729/redirect-port-80-to-8080-and-make-it-work-on-local-machine#444737>

    sudo ssh -gNL 80:127.0.0.1:8080 your_user@localhost

#### Reverse tunneling

<http://tunnelsup.com/raspberry-pi-phoning-home-using-a-reverse-remote-ssh-tunnel>

On `h4` SailfishOS:

    ssh -N -R localhost:55555:localhost:22 danil@h5.example.org

On `h5` server:

    ssh -l nemo -p 55555 localhost

## Transparent multi-hop SSH agent forwarding

<http://stackoverflow.com/questions/17846529/could-not-open-a-connection-to-your-authentication-agent#17695338>
<http://sshmenu.sourceforge.net/articles/transparent-mulithop.html>

    eval `ssh-agent`
    ssh-add *pem
    ssh -A -t -p 9922 medapp2.waveaccess.ru ssh -A danil@192.168.0.38

## Audit

`net-analyzer/ssh-audit` <https://github.com/arthepsy/ssh-audit>

    ssh-audit example.org
