# Aptitude

    aptitude --prompt clean
    aptitude --prompt full-upgrade
    aptitude --prompt purge ~c
    aptitude search . | grep "^i   " \
                      | awk '{ FS = " " ; OFS = " " ; print $2 }' \
                      | less --chop-long-lines --ignore-case
    aptitude show catdoc

## Upgrade

Upgrades installed packages to their most recent version

    aptitude update
    aptitude --prompt safe-upgrade

## Install

    aptitude install indicator-brightness

## Uninstall

    aptitude remove indicator-brightness

## Search

### Installed

<http://unix.stackexchange.com/questions/104374/how-to-show-only-installed-packages-by-executing-aptitude-search#104388>

    aptitude search '~i ^emacs'

#### By description

    aptitude search '~i ~d ^emacs'

### Not installed

<http://unix.stackexchange.com/questions/104374/how-to-show-only-installed-packages-by-executing-aptitude-search#104388>

    aptitude search '!~i ^emacs'

#### From source

<http://askubuntu.com/questions/437255/how-to-install-emacs-24-4-on-ubuntu#546050>

    aptitude install build-essential
    aptitude build-dep emacs24
    wget http://mirror.team-cymru.org/gnu/emacs/emacs-24.4.tar.gz \
      && tar xf emacs-24.4.tar.gz \
      && cd emacs-24.4
    ./configure --prefix=$HOME \
      && make -j9 \
      && make install
