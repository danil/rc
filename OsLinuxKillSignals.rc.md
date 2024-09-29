# [POSIX][] [Signal][]s rc

[posix]: https://en.wikipedia.org/wiki/POSIX
[signal]: https://en.wikipedia.org/wiki/Signal_(IPC)#POSIX_signals>

*   DOC `SIGTERM` `15` Terminate is the termination signal.
*   DOC `SIGKILL`  `9` Kill termination cannot be caught or ignored.
*   DOC `SIGHUP`   `1` Hangup.
*   DOC `SIGUSR1` `10` Signal is an user-defined condition.
*   DOC `SIGUSR2` `12` Signal is an user-defined condition.
* HOWTO List processes `ps auxf`
* HOWTO Kill `kill -15 -SIGKILLHUP $(cat /var/run/your/process.pid)`
* HOWTO Kill by regex `pkill --full your-command-and-arg-regex` <sup><sub>Kill process by matched command regex</sub></sup>
* HOWTO Kill child processes VER2 `pstree -A -p $$ | grep -Eow "[0-9]+" | xargs kill` <sup><sub>Kill all sub-processes spawned by your script [3432751458][]</sub></sup>
* HOWTO Kill child processes VER1 `-P 100500 --parent=100500` <sup><sub>Kill sub-processes spawned by your script</sub></sup>

[3432751458]: https://unix.stackexchange.com/questions/706765/how-do-i-kill-all-subprocesses-spawned-by-my-bash-script#706789

## HOWTO Logout user <sup><sub>Kick them out [3203453744][]</sub></sup>

    who

danil    tty7         2013-06-19 13:06 (:0)
john     pts/6        2013-06-20 15:33 (192.168.0.2)

    ps aut

danil    25529  0.0  0.0  30656  6632 pts/7    Ss+  10:00   0:00 /bin/bash
john     31085  0.0  0.0  29064  5028 pts/6    Ss+  15:33   0:00 -bash

    echo "HAHAHAHAHAHAHAHA" | write john pts/6
    kill 31085

[3203453744]: http://unix.stackexchange.com/questions/615/how-do-you-kick-a-benign-user-off-your-system#622
