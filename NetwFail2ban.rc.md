# Fail2ban rc

<http://wiki.gentoo.org/wiki/Fail2ban#Interacting>.

    fail2ban-client status
    fail2ban-client status ssh-iptables

## Unban

<http://serverfault.com/questions/285256/how-to-unban-an-ip-properly-with-fail2ban#475117>.

    fail2ban-client set ssh-iptables unbanip 188.134.8.88

## Alternatives

1. `sshguard` <https://bitbucket.org/sshguard/sshguard>, <https://sshguard.net>, <https://wiki.archlinux.org/title/Sshguard>, <https://wiki.gentoo.org/wiki/Sshguard>. PROS: [C][].
2. `badactor` PROS: <https://github.com/jaredfolkins/badactor>. [Go][].
3. `crowdsec` Written by french company backed <https://github.com/crowdsecurity/crowdsec>. PROS: [Go][].
4. `denyhosts` <https://github.com/denyhosts/denyhosts>. CONS: [Python][].
5. `knock` actually is not client block/jail, is an port knocking daemon,<https://github.com/jvinet/knock>, <https://en.wikipedia.org/wiki/Port_knocking>. PROS: [C][].

[c]: https://iso.org/standard/74528.html
[go]: https://github.com/golang/go
[python]: https://github.com/python/cpython
