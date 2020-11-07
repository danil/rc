# Fail2ban

<http://wiki.gentoo.org/wiki/Fail2ban#Interacting>.

    fail2ban-client status
    fail2ban-client status ssh-iptables

## Unban

<http://serverfault.com/questions/285256/how-to-unban-an-ip-properly-with-fail2ban#475117>.

    fail2ban-client set ssh-iptables unbanip 188.134.8.88

## Alternatives

1. `sshguard` written on c <https://bitbucket.org/sshguard/sshguard>, <https://sshguard.net>, <https://wiki.archlinux.org/index.php/Sshguard>, <https://wiki.gentoo.org/wiki/Sshguard>
2. `badactor` written on golang https://github.com/jaredfolkins/badactor
3. `denyhosts` written on python https://github.com/denyhosts/denyhosts
4. `knock` actually is not client block/jail, is an port knocking daemon, written on c <https://github.com/jvinet/knock>, <https://en.wikipedia.org/wiki/Port_knocking>
