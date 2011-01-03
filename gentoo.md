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

    MAKEOPTS="-j1" emerge --verbose --ask --oneshot sys-libs/glibc
    emerge --verbose --search emacs
    emerge --sync
    USE="-mmx" emerge --pretend -1 --verbose --deep --update --newuse world
    emerge --verbose --ask --deep --emptytree --newuse world
    emerge --verbose --ask --unmerge mail-mta/ssmtp
    emerge --prune gentoo-sources
    emerge --verbose --ask --deep --noreplace =gentoo-sources-2.6.30-r4
    emerge --pretend -1 --verbose --deep --depclean
    emerge --verbose --ask --depclean dev-lang/python
    emerge --info

### Recompiling all packages on the system

    emerge --emptytree world

Equery
-----

    equery list nginx
    equery files alsa-lib
    equery depends app-editors/emacs
    equery uses =emacs-22.3-r2 --all

Portage-utils
-------------

    qfile /usr/share/fonts/misc/9x18.pcf.gz
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
    equery uses app-editors/emacs

Layman
------

<http://gentoo.org/proj/en/overlays/userguide.xml?style=printable#doc_chap2_sect2>,
<http://en.gentoo-wiki.com/wiki/Overlay#Layman> and
<http://overlays.gentoo.org/proj/sunrise>

    layman --list
    layman --list-local
    layman --add=allenjb
    layman --delete=sunrise
    layman --sync=sunrise
    layman --sync-all

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

#### Deprecated

Installed packages and listed in overlay (this command counts then
twice) might be installed from overlay

    equery list -o |sort |uniq -c |sort -n

repoman
-------

    repoman full --without-mask --include-dev
    repoman manifest

Freeing Up Disk Space
---------------------

    eclean-dist
    eclean distfiles

<http://en.gentoo-wiki.com/wiki/Freeing_Up_Disk_Space#Removing_Ancient_Distfiles_and_Binaries>

TAB-Completion
--------------

<http://en.gentoo-wiki.com/wiki/TAB-Completion#Other_commands>:

    for i in $(ls --color=no /usr/share/bash-completion/); \
      do eselect bashcomp enable $i; done

Other
-----

    revdep-rebuild --ignore
    revdep-rebuild --verbose --pretend --library libreadline.so.5
    lafilefixer --justfixit
    rc-update -v show
    rc-update add xdm default
    rc-update del xdm default
    env-update && source /etc/profile
    find /etc -iname "._cfg????_*" 2> /dev/null
    CCACHE_DIR="/var/tmp/ccache" ccache -s
    eselect kernel list
    eselect kernel set 1
    eselect news list
    module-rebuild list
    module-rebuild populate; module-rebuild rebuild

Clean out your world file with app-portage/udept
<http://forums.gentoo.org/viewtopic-t-142475.html>:

    dep --pretend --pruneworld


<!-- Created: 10 Jul 2009. -->
