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

* `^` Line begin
* `$` Line end

## Jump list

* `Ctrl i` newer position
* `Ctrl o` older position

## Scroll

* `Ctrl e` Down
* `Ctrl y` Up

## Buffer

<https://github.com/jlanzarotta/bufexplorer> buffer of a buffers list

* `Ctrl ^` or <Ctrl 6>  Open previous
* `:bd`                 Delete
* `:bw`                 Delete
* `:file your-nm`       Rename

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
* `:noh` Unhighlight

## Fuzzy

* https://github.com/junegunn/fzf.vim

## Session

<https://github.com/tpope/vim-obsession>

* `:mks!`               Save
* `:source Session.vim` Load

## Autocomplete

`Ctrl n`

## Terminal mode

* `:h terminal-emulator`
* `:terminal` Terminal
* `Ctrl w N`     Normal
* `i` or `a`  Terminal

## Plugins

* <https://github.com/junegunn/vim-plug> plugins manager
* <https://github.com/tpope/vim-fugitive> git
* <https://github.com/vim-airline/vim-airline> status line a-la powerline
