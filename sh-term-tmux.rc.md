# tmux terminal multiplexer rc

[tmux][] [crash course][].

[crash course]: https://robots.thoughtbot.com/a-tmux-crash-course
[tmux]: https://github.com/tmux/tmux

## Install/compile/build

    ./autogen.sh \
    && ./configure --prefix="$HOME"/.local/usr/local --enable-utempter \
    && make --jobs=5 \
    && make install

## Window

* `<Prefix-c>` Create new window with next availble index.
* `<Prefix-3>` Select window by index from 0 to 9 (for examle 3).
* `<Prefix-'>` Select the window index <https://superuser.com/questions/755634/how-to-quickly-switch-to-n-10-windows-in-tmux#764108>.
* `<Prefix-w>` Choose index interactively <https://superuser.com/questions/755634/how-to-quickly-switch-to-n-10-windows-in-tmux#764108>.
* `<Prefix-">` or `:split-window`    Split window.
* `<Prefix-%>` or `:split-window -h` Split window.
* `:move-window -t 42` Move current window from his index to new index (for example to 42).

## Pane within window

* `<Prefix-q-0>` Pane select by number.
* `<Prefix-!>` or `:break-pane` Pane break.
* `:join-pane -s 1` Pane join. For example join pane 1 from pane 0 <https://forums.pragprog.com/forums/242/topics/10533>

## Layout

`<Prefix-space>` or `next-layout` Cycles through available layouts <http://superuser.com/questions/493048/how-to-convert-2-horizontal-panes-to-vertical-panes-in-tmux#493057>.

## Session

* `tmux -S /tmp/pair ls` List.
* `tmux -S /tmp/pair -s your-sess && chmod 777 /tmp/pair` Socket session create.
* `tmux -S /tmp/pair attach -t your-sess` Attach.
* `<Prefix-d>` or `tmux detach` Detach.
* `<Prefix-D>` Dettach/close/kill by name <https://stackoverflow.com/questions/22138211/how-do-i-disconnect-all-other-users-in-tmux>.
* `tmux kill-session -t your-sess` Kill.

## Session attach by hostname or create new session if no session exists

`tmux -S /tmp/tmux-pair attach -t $(hostname) || tmux -S /tmp/tmux-pair new -s $(hostname)`

## Change status line color to black

`:set status-style bg=black`

## Detach self current sesstion

* `<Prefix-d>`

## Detach sesstion by name

* `<Prefix-D>`

## Copy past

1. `<Prefix-[>` Enter copy mode.
2. `<C-space>`  Start selecting.
3. `<M-w>`      Copy region.
4. `<Prefix-]>` Past selection.

## Coppy yank plugin

Copying to operation system clipboard https://github.com/tmux-plugins/tmux-yank
