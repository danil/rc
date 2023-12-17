# ls and stat rc

## HOWTO ls: sort by size largest first

    ls -l -a --all -h --human-readable -S --sort=size your/dir | tail -n 1

## HOWTO ls: sort by size smallest first

    ls -l -a --all -h --human-readable -S --sort=size  -r --reverse your/dir | tail -n 1

## HOWTO stat: last modified time

    stat your/file
