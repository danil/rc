# Font rc

## Get default

<http://stackoverflow.com/questions/2153772/linux-firefox-default-sans-serif-font#2539979>.

    fc-match sans-serif
    fc-match monospace

## [List all fonts][]

    fc-list

[list all fonts]: https://wiki.archlinux.org/title/fonts#List_all_installed_fonts

## Find font

    fc-list | grep -i dejavu

## Rebuilding cache

* <https://wiki.archlinux.org/title/fonts#Manual_installation>
* <https://wiki.ubuntu.com/Fonts#Manually>

    fc-cache --force --verbose

## OTF better than TTF

Difference between OTF (Open Type) or TTF (True Type)
<http://superuser.com/questions/96390/difference-between-otf-open-type-or-ttf-true-type-font-formats#96399>
