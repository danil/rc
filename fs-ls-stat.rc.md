# ls rc

## HOWTO sort by size largest first

    ls -l -a --all -h --human-readable -S --sort=size your/dir | tail -n 1

## HOWTO sort by size smallest first

    ls -l -a --all -h --human-readable -S --sort=size  -r --reverse your/dir | tail -n 1
