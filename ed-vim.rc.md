# Vim rc

https://vim.rtorr.com

## Undo/redo

* `u` Undo.
* `U` Redo.

## Delete/cut

* `x`  Delete character.
* `dd` Delete a line.

## Mode

* `i` or `a`      Insert.
* `v` or `Ctrl v` Visual.

## Yanks

* `Y` or `yy`
* `10Y`

## Paste

`P` or `p`

## Reload/reread file

`:e`

## Sort visual lines

`:sort`

## Cursor move/navigation

* `b` Backwards to the start of a word.
* `w` Forwards to the start of a word.
* `^` Line begin.
* `$` Line end.

## Jump list position

* `Ctrl i` Newer.
* `Ctrl o` Older.

## Scroll

* `Ctrl e` Down.
* `Ctrl y` Up.

## Buffer

[bufexplorer][] is a buffer of a buffers list.

[bufexplorer]: https://github.com/jlanzarotta/bufexplorer

## Buffer open/create new unnamed buffer

* `:new`  In a horizontally split window.
* `:enew` In the current window.
* `:vnew` In a vertically split window.

## Buffer close/delete buffer

* `:bd` or `:bdel` or `:bdelete` Hide.
* `:bw` Destroy/wipeout.

## Buffer

* `Ctrl ^` or <Ctrl 6> Open previous.
* `:file your-nm`      Rename.

## Tab

* `:tabnew` Open/create unnamed buffer.
* `:tabc` or `:tabclose` Close/delete.

## Window

* `:Close` `Ctrl w c`
* `:Only`  `Ctrl w o` Close/delete other.

## Case conversion

* `~`    Switch char case.
* `guaw` Word to lower.
* `gUaw` Word to uppper.

## Directories/file system navigation

`:Ex`

## Search

* `/`    Case sensitive.
* `/\c`  Case insensitive.
* `*`    Word under cursor forward.
* `#`    Word under cursor backward.
* `:noh` Unhighlight.

## Fuzzy

[fzf.vim][]

[fzf.vim]: https://github.com/junegunn/fzf.vim

## History/recent files

* `:bro ol` or `:browse oldfiles` then type number of file name.

## List error messages

1. `:echo :messages`
2. `:enew` then `:put = execute('messages')`
3. Redirect to file:
   ```
   :redir > messages.txt
   :messages
   :redir END
   :e messages.txt
   ```

## Session

[vim-obsession][]

* `:mks!`               Save.
* `:source Session.vim` Load.

[vim-obsession]: https://github.com/tpope/vim-obsession

## Autocomplete

`Ctrl n`

## Terminal mode

* `:h terminal-emulator`
* `:terminal` Terminal.
* `Ctrl w N`  Normal.
* `i` or `a`  Terminal.

## Plugins

* [vim-plug][]     Plugins manager.
* [vim-fugitive][] Git.
* [vim-airline][]  Status line a-la powerline.

[vim-plug]: https://github.com/junegunn/vim-plug
[vim-fugitive]: https://github.com/tpope/vim-fugitive
[vim-airline]: https://github.com/vim-airline/vim-airline
