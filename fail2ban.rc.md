# Fail2ban

<http://wiki.gentoo.org/wiki/Fail2ban#Interacting>.

    fail2ban-client status
    fail2ban-client status ssh-iptables

## Unban

<http://serverfault.com/questions/285256/how-to-unban-an-ip-properly-with-fail2ban#475117>.

    fail2ban-client set ssh-iptables unbanip 188.134.8.88

## Alternatives

1. https://bitbucket.org/sshguard/sshguard, written on c (<https://sshguard.net>, <https://wiki.archlinux.org/index.php/Sshguard>)
2. https://github.com/jaredfolkins/badactor written on c
3. https://github.com/jvinet/knock written on c
