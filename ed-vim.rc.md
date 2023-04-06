# Vim rc

1. [documentation][];
2. [vim script][]s;
3. [cheat sheet][];

[cheat sheet]: https://vim.rtorr.com
[documentation]: https://vimhelp.org
[vim script]: https://github.com/vim-scripts

## Modes

Esc or <C-[>.

* `Esc` or `<C-[>` *[Normal][]*.
* `i`     *[Insert][]* before the cursor.
* `a`     *[Insert][]* insert (append) after the cursor.
* `I`     *[Insert][]* at the beginning of the line.
* `A`     *[Insert][]* (append) at the end of the line.
* `v`     *[Visual][]* character*.
* `V`     *[Visual][]* line*.
* `<C-v>` *[Visual][]* block*.
* `:`     *[command line][]*.
* `:` then `<C-f>` Search [command line][] history.

[command line]: https://vimhelp.org/cmdline.txt.html
[insert]: https://vimhelp.org/insert.txt.html
[normal]: https://vimhelp.org/index.txt.html#normal-index
[visual]: https://vimhelp.org/visual.txt.html

## Key mod mappings/bindings

`:nmap` [Normal][].
`:vmap` [Visual][].
`:imap` [Insert][].
`:Maps` [Normal][] by [fzf][].

## Leader key

Default [leader key][] key is `\` [remap leader key][]/redefine/replace
by popular alternative:

    " Map the leader key to a comma.
    let mapleader = ','

[leader key]: https://reddit.com/r/vim/wiki/the_leader_mechanism
[remap leader key]: https://vimhelp.org/map.txt.html#mapleader

## Undo/redo

* `u` Undo.
* `U` Redo.

## Delete/cut

* `x`  Delete character.
* `dd` Delete a line.

## Copy/yank line

* `Y` or `yy`
* `10Y`

## Paste

`P` or `p`

## Window navigation

* `<C-w>j`
* `<C-w>k`
* `<C-w>h`
* `<C-w>l`

## Search

* `/`    Case sensitive.
* `?`    Backward.
* `/\c`  Case insensitive.
* `*`    Word under cursor forward.
* `#`    Word under cursor backward.
* `:noh` Unhighlight.

## Cursor move/navigation by word

* `b` Backwards to the start of a word.
* `w` Forwards to the start of a word.

## Cursor move/navigation by line

* `^` Line begin.
* `$` Line end.

## Cursor move/navigation by file

* `gg` File beginning.
* `G`  File end.

## Jump list position

* `<C-i>` Newer.
* `<C-o>` Older.

## Scroll

* `<C-e>` Down.
* `<C-y>` Up.

## Buffer list

1. `<Leader-be>` or `:BufExplorer` List buffers in a [bufexplorer][] buffer.
2. `:Buffers` Fuzzy find buffer by [fzf][].

[bufexplorer]: https://github.com/jlanzarotta/bufexplorer
[fzf]: https://github.com/junegunn/fzf.vim

## Buffer open/create new unnamed buffer

* `:new`  In a horizontally split window.
* `:enew` In the current window.
* `:vnew` In a vertically split window.

<https://stackoverflow.com/questions/4478111/vim-how-do-you-open-another-no-name-buffer-like-the-one-on-startup#4478193>

## Buffer/file close/delete/kill buffer _without save_

* `:bd` or `:bdel` or `:bdelete` Hide.
* `:bw` Destroy/wipeout.

## Save file and close/delete buffer

* `:w|bd` Save and hide.
* `:w|bw` Save and destroy.

## Buffer

* `<C-^>` or `<C-6>` Open previous.
* `:file your-nm`  Rename.

## Tab

* `:tabnew` Open/create unnamed buffer.
* `:tabc` or `:tabclose` Close/delete.

## Window

* `<C-w>o` `:Only` Close/delete other.
* `<C-w>=` Balance/equalize width and height of all windows.
* `<C-w>+` `<C-w>-` Increase/decrease height.
* `<C-w>>` `<C-w><` Increase/decrease width.
* `<C-w>c` `:Close`

## Line numbers

* `set nu` or `set number` Show/turn on.
* `set nonu` or `set nonumber` Hide/turn off.

## Reload/reread file

`:e`

## Save file/write

* `:w`

## Open directory of the current open file/file system navigation

* `:e` then *your/file.name*

## Create a new file in the directory of the current open file

`:e %:h/your.file`

## Open directory of the current open file/file system navigation

* `:Ex` or `:Explore` then *your/dir/name*
* `:Sex`

## Fuzzy

1. [fzf][]
2. [clap][]

[clap]: https://github.com/liuchengxu/vim-clap

## History/recent files

* `:bro ol` or `:browse oldfiles` then type number of file name.

## Sort visual lines

`:sort`

## List error messages

1. `:messages`
2. `:enew` then `:put = execute('messages')`
3. Redirect to a file:
   ```
   :redir > messages.txt
   :messages
   :redir END
   :e messages.txt
   ```

## Configuration reload/refresh

`:so $MYVIMRC` or `:source $MYVIMRC`

## Read/evaluate current file

`:so %` or `:source %`

## Session

[obsession][]

* `:mks!`               Save.
* `:source Session.vim` Load.

[obsession]: https://github.com/tpope/vim-obsession

## Autocomplete

`<C-n>`

## Terminal mode

* `:h terminal-emulator`
* `:terminal` Terminal.
* `<C-w>N`    Normal.
* `i` or `a`  Terminal.

## Plugins

* [plug][]     Plugins manager.
* [fugitive][] Git.
* [airline][]  Status line a-la powerline.

[airline]: https://github.com/vim-airline/vim-airline
[fugitive]: https://github.com/tpope/vim-fugitive
[plug]: https://github.com/junegunn/vim-plug

## Case conversion

* `~`    Switch char case.
* `guaw` Word to lower.
* `gUaw` Word to uppper.

## Dark high-contrast color scheme.

1. Put [vividchalk][] in `~/vim/colors/` or `Plug 'tpope/vim-vividchalk'`

[vividchalk]: https://github.com/tpope/vim-vividchalk
