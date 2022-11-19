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
* `v` or `C v` Visual

## Yanks

* `Y` or `yy`
* `10Y`

## Paste

`P` or `p`

## Reload/reread file

`:e`

## Sort visual lines

`:sort`

## Move cursor

* `^` Line begin
* `$` Line end
* `C o` and `C i` moving to previous postion

## Scroll

* `C e` Down
* `C y` Up

## Buffer

<https://github.com/jlanzarotta/bufexplorer> buffer of a buffers list

* `C ^` or <C 6>  Open previous
* `:bd`           Delete
* `:bw`           Delete
* `:file your-nm` Rename

## Window

* `:Close` `C w c`
* `:Only`  `C w o` Close other

## Case conversion

* `~`    Switch char case
* `guaw` Word to lower
* `gUaw` Word to uppper

## Directories/file system navigation

`:Ex`

## Search

* `/`    Case sensitive
* `/\c`  Case insensitive
* `:noh` Unhighlight

## Fuzzy

* https://github.com/junegunn/fzf.vim

## Session

<https://github.com/tpope/vim-obsession>

* `:mks!`               Save
* `:source Session.vim` Load

## Autocomplete

`C n`

## Terminal mode

* `:h terminal-emulator`
* `:terminal` Terminal
* `C w N`     Normal
* `i` or `a`  Terminal

## Plugins

* <https://github.com/junegunn/vim-plug> plugins manager
* <https://github.com/tpope/vim-fugitive> git
* <https://github.com/vim-airline/vim-airline> status line a-la powerline
