# Signals

<https://en.wikipedia.org/wiki/Signal_(IPC)#POSIX_signals>

* `SIGKILL` 9   Terminate   kill (cannot be caught or ignored)
* `SIGTERM` 15  Terminate   termination signal

## List processes

    ps auxf

## kill

    kill -HUP $( cat /var/run/your_process.pid )

### 10 SIGUSR1

Signal `10` or `SIGUSR1` is an user-defined condition

    kill -10 $( cat /var/run/your_process.pid )
    kill -SIGUSR1 $( cat /var/run/your_process.pid )

### 12 SIGUSR2

Signal `12` or `SIGUSR2` user-defined condition

    kill -12 $( cat /var/run/your_process.pid )
    kill -SIGUSR2 $( cat /var/run/your_process.pid )

## pkill

Kill process by matched command regex

    pkill --full command-match-regex

## Logout user

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
