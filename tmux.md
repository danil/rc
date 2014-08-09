<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

Terminal multiplexers
=====================

GNU Screen
----------

    screen btdownloadcurses some.torrent
    screen -S debian_torrent
    screen -r <PID> # Reconnect to screen.
    screen -RD
    screen -x debian_torrent # Reconnect to screen.

### Scrollback or copy mode

<http://superuser.com/questions/138748/how-to-scroll-up-and-look-at-data-in-gnu-screen>.

* To enter hit the prefix key and, then `[`
* Escape to exit.
]

tmux
----

    tmux new -s danil
    ^b d
    tmux attach -t danil

### Pane

#### Select by number

    prefix + q
    0

#### Join pane 1 from pane 0

<https://forums.pragprog.com/forums/242/topics/10533>

    join-pane -s 1

### Session

#### List

    tmux ls

#### Kill

    tmux kill-session -t danil

### Socket session

#### Create

    tmux -S /tmp/pair
    chmod 777 /tmp/pair

#### Attach

    tmux -S /tmp/pair attach
