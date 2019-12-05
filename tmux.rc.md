# tmux

https://robots.thoughtbot.com/a-tmux-crash-course

## Install

    ./autogen.sh && ./configure --prefix=$HOME/.local && make --jobs=5 && make install

## Copy past

* enter copy mode using `prefix+[`
* start selecting `C-space`
* copy region `M-w`
* past selection `prefix+]`

## Window

`split-window`

    prefix + "

`split-window -h`

    prefix + %

## Pane

### Select by number

    prefix + q
    0

### Break

`break-pane`

    prefix + !

### Join

Join pane 1 from pane 0 <https://forums.pragprog.com/forums/242/topics/10533>

    join-pane -s 1

## Layout

`next-layout` cycles through available layouts
<http://superuser.com/questions/493048/how-to-convert-2-horizontal-panes-to-vertical-panes-in-tmux#493057>.

    prefix + space

## Session

### List

    tmux -S /tmp/pair ls

### Create

Socket session create

    tmux -S /tmp/pair -s foobar
    chmod 777 /tmp/pair

### Attach

    tmux -S /tmp/pair attach -t foobar

### Detach

`tmux detach`: `prefix + d`

### Dettach by name

<https://stackoverflow.com/questions/22138211/how-do-i-disconnect-all-other-users-in-tmux>

    prefix + D

### Kill

    tmux kill-session -t danil

## Other

    tmux new -s danil
    ^b d
    tmux attach -t danil
