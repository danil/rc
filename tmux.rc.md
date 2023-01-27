# tmux

https://robots.thoughtbot.com/a-tmux-crash-course

## Install/compile/build

    ./autogen.sh \
    && ./configure --prefix="$HOME"/.local/usr/local --enable-utempter \
    && make --jobs=5 \
    && make install

## Copy past

* enter copy mode using `prefix+[`
* start selecting `C-space`
* copy region `M-w`
* past selection `prefix+]`

## Coppy yank

Copying to operation system clipboard https://github.com/tmux-plugins/tmux-yank

## Window

`split-window`

    prefix + "

`split-window -h`

    prefix + %

## Pane select by number

    prefix + q
    0

## Pane break

`break-pane`

    prefix + !

## Pane join

Join pane 1 from pane 0 <https://forums.pragprog.com/forums/242/topics/10533>

    join-pane -s 1

## Layout

`next-layout` cycles through available layouts
<http://superuser.com/questions/493048/how-to-convert-2-horizontal-panes-to-vertical-panes-in-tmux#493057>.

    prefix + space

## Sessions list

    tmux -S /tmp/pair ls

## Session create

Socket session create

    tmux -S /tmp/pair -s foobar
    chmod 777 /tmp/pair

## Session attach

    tmux -S /tmp/pair attach -t foobar

## Session detach

`tmux detach`: `prefix + d`

## Session dettach by name

<https://stackoverflow.com/questions/22138211/how-do-i-disconnect-all-other-users-in-tmux>

    prefix + D

## Session kill

    tmux kill-session -t danil

## Change status line color to black

    prefix + :
    set status-style bg=black

## Other

    tmux new -s danil
    ^b d
    tmux attach -t danil
