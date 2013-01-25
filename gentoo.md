<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

Gentoo
======

Emerge
------

    MAKEOPTS="-j1" USE="-mmx" emerge --verbose --ask --oneshot sys-libs/glibc
    emerge --verbose --search emacs
    emerge -v1p --deep --update --newuse --exclude x11-base/xorg-server -- world
    emerge --verbose --ask --deep --emptytree --newuse world
    emerge --prune gentoo-sources
    emerge --verbose --ask --deep --noreplace =gentoo-sources-2.6.30-r4
    emerge --info

### Recompiling

Recompiling all packages on the system.

    emerge --emptytree system
    emerge --emptytree world

### Unmerge

    emerge --verbose -1 --pretend --deep --depclean dev-lang/python
    emerge --verbose -1 --pretend --unmerge mail-mta/ssmtp

Equery
-----

    equery list nginx
    equery list "*" |wc -l
    equery files alsa-lib
    equery depends app-editors/emacs
    equery uses =emacs-22.3-r2 --all

### Files belong to package

    equery belongs /usr/share/fonts/misc/9x18.pcf.gz

same as:

    qfile /usr/share/fonts/misc/9x18.pcf.gz

Portage-utils
-------------

    qsize emacs
    qsize -a -k | sort -n -k 6
    qdepends --all media-fonts/font-misc-misc
    qlist emacs
    quse nls
    qsearch emacs
    emaint --check world

USE flags
---------

    equery hasuse ogg
    grep -i "ogg - " /usr/portage/profiles/use.desc
    grep -i "ogg - " /usr/portage/profiles/use.local.desc
    euse --info ogg
    equery uses =sys-devel/gcc-4.6.0

Layman
------

* <http://gentoo.org/proj/en/overlays/userguide.xml?style=printable#doc_chap2_sect2>
* <http://en.gentoo-wiki.com/wiki/Overlay#Layman>
* <http://overlays.gentoo.org/proj/sunrise>

    layman --list
    layman --list-local
    layman --add=allenjb
    layman --delete=sunrise
    layman --sync=sunrise

Ebuild
------

### [Ebuild policy][]

[Ebuild policy]: <http://gentoo.org/proj/en/devrel/handbook/handbook.xml?style=printable&part=3&chap=1>

### [Manifest][]

[Manifest]: <http://devmanual.gentoo.org/general-concepts/manifest/index.html>

    ebuild msort-8.53.ebuild manifest

eix
---

    eix -vAS dev-ruby
    eix --world --categor
    eix-test-obsolete detail

### Overlays

List packages install from overlay <http://bugs.gentoo.org/204324>,
<http://bugs.gentoo.org/138622>.

    eix --installed-overlay
    eix --in-overlay unity-gentoo

#### Recompile all ebuilds from overlay

    emerge -v1 $(eix --installed --only-names --in-overlay unity-gentoo)

#### Deprecated

Installed packages and listed in overlay (this command counts then
twice) might be installed from overlay

    equery list -o |sort |uniq -c |sort -n

repoman
-------

    repoman manifest
    repoman full --without-mask --include-dev

GCC
---

Symptom: `checking whether the C compiler works... no`

    gcc-config --list-profiles
    gcc-config 2

Freeing Up Disk Space
---------------------

    eclean-dist
    eclean distfiles

<http://en.gentoo-wiki.com/wiki/Freeing_Up_Disk_Space#Removing_Ancient_Distfiles_and_Binaries>

TAB-Completion
--------------

<http://en.gentoo-wiki.com/wiki/TAB-Completion#Other_commands>:

    sudo eselect bashcomp list |grep -v "*"
    for i in $(ls --color=no /usr/share/bash-completion/); \
      do eselect bashcomp enable $i; done

Updates
-------

### Kernel

    module-rebuild list
    sudo sh -c "module-rebuild populate && module-rebuild rebuild"

### Other

    python-updater
    emacs-updater
    haskell-updater

udept
-----

Clean out your world file
<http://forums.gentoo.org/viewtopic-t-142475.html>.

    dep --pretend --pruneworld

Run levels
----------

    rc-update -v show
    rc-update add xdm default
    rc-update del xdm default
    rc-status

La files
--------

    lafilefixer --justfixit

<https://bugs.gentoo.org/show_bug.cgi?id=437084#c4>

    sudo sh -c 'env-update && source /etc/profile'

Other
-----

    sudo sh -c "layman --sync-all && emerge --sync && eix-update"
    revdep-rebuild --pretend
    revdep-rebuild --ignore
    revdep-rebuild --verbose --pretend --library libreadline.so.5
    find /etc -iname "._cfg????_*" 2> /dev/null
    CCACHE_DIR="/var/tmp/ccache" ccache -s
    eselect kernel list
    eselect kernel set 1
    eselect news list
    portageq owners / /usr/share/aclocal/vala.m4

<!-- Created: 10 Jul 2009. -->
