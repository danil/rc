Arch
====

Pacman
------

### Update

Download package list and upgrade

    pacman --sync --verbose --refresh --sysupgrade

### Install

    yaourt --verbose --sync lightdm-gtk3-greeter

### Remove

    pacman --remove --recursive cairo-dock-plugins

### Query

<https://wiki.archlinux.org/index.php/Pacman#Querying_package_databases>

#### Search

    pacman --query --search silver

#### Explicitly installed

Except `base` and `base-devel` packages
<https://bbs.archlinux.org/viewtopic.php?pid=690050#p690050>.

    pacman --query --explicit --info \
      | awk '/^Name/ { name=$3 } /^Groups/ { if ( $3 != "base" && $3 != "base-devel" ) { print name } }'

#### orphans

Useless packages, that are not associated with explicitly installed packages
<https://bbs.archlinux.org/viewtopic.php?pid=690008#p690008>.

    pacman --query --deps --unrequired --quiet

File belong to package
----------------------

    pkgfile emacs

AUR
---

Arch User Repository <https://wiki.archlinux.org/index.php/Arch_User_Repository>.

### PKGBUILD

<https://wiki.archlinux.org/index.php/Arch_User_Repository#Installing_packages>

#### Compile and pack

    makepkg -s

#### Install

    pacman --upgrade yaourt-1.3-1-any.pkg.tar.xz

Yaourt
------

Yet AnOther User Repository

Search and install
------------------

    yaourt compiz-dev

### Update AUR

<https://bbs.archlinux.org/viewtopic.php?pid=604848#p604848>

    yaourt --sync --refresh --sysupgrade --aur
