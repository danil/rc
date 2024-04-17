# ls and stat rc

## HOWTO ls: List only directory name without/instead of content/subdirectory <sup>[2113141088][]</sup>

    ls -l -d --directory path/to/your/dir*

[2113141088]: https://superuser.com/questions/141987/in-linux-how-to-ls-l-a-directory-and-not-the-contents-of-that-directory#141989

## HOWTO ls: sort by size largest first

    ls -l -a --all -h --human-readable -S --sort=size your/dir | tail -n 1

## HOWTO ls: sort by size smallest first

    ls -l -a --all -h --human-readable -S --sort=size  -r --reverse your/dir | tail -n 1

## HOWTO stat: last modified time

    stat your/file
