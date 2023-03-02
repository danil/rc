# Vim rc

https://vim.rtorr.com

## Undo/redo

* `u` Undo
* `U` Redo

## Delete/cut

* `x`  Delete character
* `dd` Delete a line

## Mode

* `i` or `a`   Insert
* `v` or `Ctrl v` Visual

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

* `b` Backwards to the start of a word
* `w` Forwards to the start of a word
* `^` Line begin
* `$` Line end

## Jump list

* `Ctrl i` Newer position
* `Ctrl o` Older position

## Scroll

* `Ctrl e` Down
* `Ctrl y` Up

## Buffer

[bufexplorer][] is a buffer of a buffers list

* `Ctrl ^` or <Ctrl 6>  Open previous
* `:bd`                 Delete
* `:bw`                 Delete
* `:file your-nm`       Rename

[bufexplorer]: https://github.com/jlanzarotta/bufexplorer

## Window

* `:Close` `Ctrl w c`
* `:Only`  `Ctrl w o` Close other

## Case conversion

* `~`    Switch char case
* `guaw` Word to lower
* `gUaw` Word to uppper

## Directories/file system navigation

`:Ex`

## Search

* `/`    Case sensitive
* `/\c`  Case insensitive
* `*`    Word under cursor forward
* `#`    Word under cursor backward
* `:noh` Unhighlight

## Fuzzy

[fzf.vim][]

[fzf.vim]: https://github.com/junegunn/fzf.vim

## Session

[vim-obsession][]

* `:mks!`               Save
* `:source Session.vim` Load

[vim-obsession]: https://github.com/tpope/vim-obsession

## Autocomplete

`Ctrl n`

## Terminal mode

* `:h terminal-emulator`
* `:terminal` Terminal
* `Ctrl w N`     Normal
* `i` or `a`  Terminal

## Plugins

* [vim-plug][] plugins manager
* [vim-fugitive][] git
* [vim-airline][] status line a-la powerline

[vim-plug]: https://github.com/junegunn/vim-plug
[vim-fugitive]: https://github.com/tpope/vim-fugitive
[vim-airline]: https://github.com/vim-airline/vim-airline
