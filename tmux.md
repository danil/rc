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
    screen new -s debian-torrent
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

### Copy past

* enter copy mode using `prefix+[`
* start selecting `C-space`
* copy region `M-w`
* past selection `prefix+]`

### Window

`split-window`

    prefix + "

`split-window -h`

    prefix + %

### Pane

#### Select by number

    prefix + q
    0

#### Break

`break-pane`

    prefix + !

#### Join

Join pane 1 from pane 0 <https://forums.pragprog.com/forums/242/topics/10533>

    join-pane -s 1

#### Layout

`next-layout` cycles through available layouts
<http://superuser.com/questions/493048/how-to-convert-2-horizontal-panes-to-vertical-panes-in-tmux#493057>.

    prefix + space

### Session

#### List

    tmux -S /tmp/pair ls

#### Kill

    tmux kill-session -t danil

### Socket session

#### Create

    tmux -S /tmp/pair
    chmod 777 /tmp/pair

#### Attach

    tmux -S /tmp/pair attach

#### Detach

    tmux detach

### Other

    tmux new -s danil
    ^b d
    tmux attach -t danil
