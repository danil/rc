Gentoo
======

Emerge
------

    MAKEOPTS="-j1" emerge --verbose --ask --oneshot sys-libs/glibc
    emerge --verbose --search emacs
    emerge --sync
    USE="-mmx" emerge --verbose --pretend --deep --update --newuse world
    emerge --verbose --ask --deep --emptytree --newuse world
    emerge --verbose --ask --unmerge mail-mta/ssmtp
    emerge --prune gentoo-sources
    emerge --verbose --ask --deep --noreplace =gentoo-sources-2.6.30-r4
    emerge --verbose --ask --deep --depclean
    emerge --verbose --ask --depclean dev-lang/python
    emerge --info

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

USE flags
---------

    equery hasuse ogg
    grep -i "ogg - " /usr/portage/profiles/use.desc
    grep -i "ogg - " /usr/portage/profiles/use.local.desc
    euse --info ogg

Other
-----

    revdep-rebuild --verbose --pretend --library libreadline.so.5
    lafilefixer --justfixit
    rc-update -v show
    rc-update add xdm default
    rc-update del xdm default
    env-update && source /etc/profile
    eselect bashcomp enable --global gvfs
    eclean distfiles
    find /etc -iname "._cfg????_*" 2> /dev/null
    CCACHE_DIR="/var/tmp/ccache" ccache -s
    eselect kernel list
    eselect kernel set 1
    module-rebuild list
    module-rebuild populate; module-rebuild rebuild

<!-- Created: 10 Jul 2009. -->
