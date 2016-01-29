Signals
=======

List processes
--------------

    ps auxf

pkill
-----

Kill process by matched command regex

    pkill --full command-match-regex

Logout user
-----------

Kick them out

<http://unix.stackexchange.com/questions/615/how-do-you-kick-a-benign-user-off-your-system#622>

    who

danil    tty7         2013-06-19 13:06 (:0)
john     pts/6        2013-06-20 15:33 (192.168.0.2)

    ps aut

danil    25529  0.0  0.0  30656  6632 pts/7    Ss+  10:00   0:00 /bin/bash
john     31085  0.0  0.0  29064  5028 pts/6    Ss+  15:33   0:00 -bash

    echo "HAHAHAHAHAHAHAHA" | write john pts/6
    kill 31085
