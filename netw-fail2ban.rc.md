# Fail2ban rc

<http://wiki.gentoo.org/wiki/Fail2ban#Interacting>.

    fail2ban-client status
    fail2ban-client status ssh-iptables

## Unban

<http://serverfault.com/questions/285256/how-to-unban-an-ip-properly-with-fail2ban#475117>.

    fail2ban-client set ssh-iptables unbanip 188.134.8.88

## Alternatives

1. `sshguard` written in C programming language <https://bitbucket.org/sshguard/sshguard>, <https://sshguard.net>, <https://wiki.archlinux.org/index.php/Sshguard>, <https://wiki.gentoo.org/wiki/Sshguard>.
2. `badactor` Written in Go programming language <https://github.com/jaredfolkins/badactor>.
3. `crowdsec` Written in Go programming language by french company backed <https://github.com/crowdsecurity/crowdsec>.
4. `denyhosts` Written in Python programming language <https://github.com/denyhosts/denyhosts>.
5. `knock` actually is not client block/jail, is an port knocking daemon, written in c programming language <https://github.com/jvinet/knock>, <https://en.wikipedia.org/wiki/Port_knocking>.
