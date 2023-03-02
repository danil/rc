# Vim rc

https://vim.rtorr.com

## Undo/redo

* `u` Undo.
* `U` Redo.

## Delete/cut

* `x`  Delete character.
* `dd` Delete a line.

## Mode

* `i` or `a`     Insert.
* `v` or `<C-v>` Visual.

## Yanks

* `Y` or `yy`
* `10Y`

## Paste

`P` or `p`

## Reload/reread file

`:e`

## Sort visual lines

`:sort`

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

## Command mode

`:` then `<C-f>` Search command history.

## Buffer list

1. `:BufExplorer` List buffers in a [bufexplorer][] buffer.
2. `:Buffers` Fuzzy find buffer by [fzf.vim][].

[bufexplorer]: https://github.com/jlanzarotta/bufexplorer
[fzf.vim]: https://github.com/junegunn/fzf.vim

## Buffer open/create new unnamed buffer

* `:new`  In a horizontally split window.
* `:enew` In the current window.
* `:vnew` In a vertically split window.

<https://stackoverflow.com/questions/4478111/vim-how-do-you-open-another-no-name-buffer-like-the-one-on-startup#4478193>

## Buffer close/delete buffer

* `:bd` or `:bdel` or `:bdelete` Hide.
* `:bw` Destroy/wipeout.

## Buffer

* `<C-^>` or <C-6> Open previous.
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

## Window navigation

* `<C-w>j`
* `<C-w>k`
* `<C-w>h`
* `<C-w>l`

## Case conversion

* `~`    Switch char case.
* `guaw` Word to lower.
* `gUaw` Word to uppper.

## Open directory of the current open file/file system navigation

* `:Ex` or `:Explore`
* `:Sex`

## Search

* `/`    Case sensitive.
* `/\c`  Case insensitive.
* `*`    Word under cursor forward.
* `#`    Word under cursor backward.
* `:noh` Unhighlight.

## Create a new file in the directory of the current open file

`:e %:h/your.file`

## Fuzzy

* [fzf.vim][]
* [vim-clap][]

[vim-clap]: https://github.com/liuchengxu/vim-clap

## History/recent files

* `:bro ol` or `:browse oldfiles` then type number of file name.

## List error messages

1. `::messages`
2. `:enew` then `:put = execute('messages')`
3. Redirect to file:
   ```
   :redir > messages.txt
   :messages
   :redir END
   :e messages.txt
   ```

## Configuration reload/refresh

`:so $MYVIMRC`

## Session

[vim-obsession][]

* `:mks!`               Save.
* `:source Session.vim` Load.

[vim-obsession]: https://github.com/tpope/vim-obsession

## Autocomplete

`<C-n>`

## Terminal mode

* `:h terminal-emulator`
* `:terminal` Terminal.
* `<C-w>N`    Normal.
* `i` or `a`  Terminal.

## Plugins

* [vim-plug][]     Plugins manager.
* [vim-fugitive][] Git.
* [vim-airline][]  Status line a-la powerline.

[vim-airline]: https://github.com/vim-airline/vim-airline
[vim-fugitive]: https://github.com/tpope/vim-fugitive
[vim-plug]: https://github.com/junegunn/vim-plug
