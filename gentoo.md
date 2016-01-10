<!-- -*- coding: utf-8; -*- -->

# Gentoo

# Emerge

    MAKEOPTS="-j1" USE="-mmx" emerge --ask --oneshot your-package/name
    emerge --verbose --search emacs
    emerge --prune gentoo-sources
    emerge --verbose --ask --deep --noreplace =gentoo-sources-2.6.30-r4
    emerge --info

## Update

### With build time dependencies

<https://www.gentoo.org/proj/en/portage/doc/faq.xml?style=printable#doc_chap1_sect2>

    emerge --color=y --oneshot --deep --newuse --update \
           --backtrack=1000000 --with-bdeps=y @world

### Exclude

    emerge --update --exclude you-whant/to-exclude-package -- world

### Kernel modules

<http://wiki.gentoo.org/wiki/Kernel/Upgrade#Reinstall_external_kernel_modules>

    emerge --oneshot @module-rebuild

## Recompile

Recompiling all packages on the system.

    emerge --emptytree system
    emerge --emptytree world

## Unmerge

    emerge --oneshot --deep --depclean your-package/name
    emerge --oneshot --unmerge your-package/name

## Ceanup all

    emerge --quiet --deep --depclean

# Equery

    equery list nginx
    equery list "*" |wc -l
    equery files alsa-lib
    equery depends your-package/name
    equery uses =emacs-22.3-r2 --all

## Files belong to package

    equery belongs /usr/share/fonts/misc/9x18.pcf.gz

same as:

    qfile /usr/share/fonts/misc/9x18.pcf.gz

# Portage-utils

    qsize emacs
    qsize -a -k | sort -n -k 6
    qdepends --all media-fonts/font-misc-misc
    qlist emacs
    quse nls
    qsearch emacs
    emaint --check world

# USE flags

    equery hasuse ogg
    grep -i "ogg - " /usr/portage/profiles/use.desc
    grep -i "ogg - " /usr/portage/profiles/use.local.desc
    euse --info ogg
    equery uses =sys-devel/gcc-4.6.0

# Layman

* <http://gentoo.org/proj/en/overlays/userguide.xml?style=printable#doc_chap2_sect2>
* <http://en.gentoo-wiki.com/wiki/Overlay#Layman>
* <http://overlays.gentoo.org/proj/sunrise>

    layman --list
    layman --list-local
    layman --add=allenjb
    layman --delete=sunrise
    layman --sync=sunrise

# Ebuild

## Compile

    ebuild ~/path/to/ebuild/skippy-xd-0.5.0-r1.ebuild compile

## Install

    ebuild ~/path/to/ebuild/skippy-xd-0.5.0-r1.ebuild install

## [Ebuild policy][]

[Ebuild policy]: <http://gentoo.org/proj/en/devrel/handbook/handbook.xml?style=printable&part=3&chap=1>

## [Manifest][]

[Manifest]: <http://devmanual.gentoo.org/general-concepts/manifest/index.html>

    ebuild msort-8.53.ebuild manifest

# eix

    eix -vAS dev-ruby
    eix --world --categor
    eix-test-obsolete detail

## Downgrade (delete) or upgrade list

    eix --upgrade

## Overlays

List packages install from overlay <http://bugs.gentoo.org/204324>,
<http://bugs.gentoo.org/138622>.

    eix --installed-overlay
    eix --in-overlay unity-gentoo

### Recompile all ebuilds from overlay

    emerge --verbose --oneshot $(eix --installed --only-names --in-overlay unity-gentoo)

### Count

Count all packages

    eix --installed --compact | grep Found.*matches

### Deprecated

Installed packages and listed in overlay (this command counts then
twice) might be installed from overlay

    equery list -o | sort | uniq --count | sort --numeric-sort

# repoman

    repoman manifest
    repoman full --without-mask --include-dev

# GCC

## Upgrade

<https://www.gentoo.org/doc/en/gcc-upgrading.xml>

## Other

Symptom: `checking whether the C compiler works... no`

    gcc-config --list-profiles
    gcc-config 2

# Freeing Up Disk Space

WARNING: Avoid using eclean!
<http://makuro.wordpress.com/2010/12/12/intro-to-portage-sets>.

* <https://wiki.gentoo.org/wiki/Knowledge_Base:Freeing_disk_space>
* <https://wiki.gentoo.org/wiki/Knowledge_Base:Remove_obsoleted_distfiles>
* <https://wiki.gentoo.org/wiki/Eclean>
* <https://wiki.gentoo.org/wiki/Kernel/Removal>
* <http://en.gentoo-wiki.com/wiki/Freeing_Up_Disk_Space>

    eclean-dist
    eclean distfiles

<http://en.gentoo-wiki.com/wiki/Freeing_Up_Disk_Space#Removing_Ancient_Distfiles_and_Binaries>

# TAB-Completion

<https://wiki.gentoo.org/wiki/Bash#Tab_completion>

## List

    eselect bashcomp list --global

## Enable

    eselect bashcomp enable --global {0..703}

# Fix

Fix broken completions
<https://www.gentoo.org/support/news-items/2014-11-25-bash-completion-2_1-r90.html>

    find /usr/share/bash-completion -maxdepth 1 -type f \
      '!' -name 'bash_completion' -exec emerge -1v {} +

# Updates

## Perl cleans all packages

* <http://www.gentoo.org/proj/en/perl/perl-cleaner.xml?style=printable>
* <http://wiki.gentoo.org/wiki/Project:Perl/perl-cleaner>

    perl-cleaner --all

## Python

    eselect python set --python2 python2.7
    eselect python set --python3 python3.3
    python-updater

## Other

    emacs-updater
    haskell-updater

## udept

Clean out your world file
<http://forums.gentoo.org/viewtopic-t-142475.html>.

    dep --pretend --pruneworld

# Run levels

    rc-update -v show
    rc-update add xdm default
    rc-update del xdm default
    rc-status

# La files

    lafilefixer --justfixit

<https://bugs.gentoo.org/show_bug.cgi?id=437084#c4>

    sudo sh -c 'env-update && source /etc/profile'

# Merge configuration

## First

    dispatch-conf

## Second

    etc-update

# Netfilter

<http://wiki.gentoo.org/wiki/Iptables#Firewall>

Rules saved to `/var/lib/$ipt/rules-save` and will be loaded
with `/etc/init.d/$ipt` when machine is powered on.

## iptables

    iptables -L
    iptables-restore < /etc/iptables/v4.rules
    /etc/init.d/iptables save
    /etc/init.d/iptables start

## ip6tables

    ip6tables -L
    ip6tables-restore < /etc/iptables/v6.rules
    /etc/init.d/ip6tables save
    /etc/init.d/ip6tables start

# Rebuilding

    emerge @preserved-rebuild && revdep-rebuild

## revdep-rebuild

    revdep-rebuild --pretend
    revdep-rebuild --ignore
    revdep-rebuild --verbose --pretend --library libreadline.so.5

# Set UTC time zone

<https://wiki.gentoo.org/wiki/System_time#OpenRC>

    find /usr/share/zoneinfo -maxdepth 1 -type f -name UTC \
         -exec sh -c 'echo {} | sed "s|^/usr/share/zoneinfo/||" > /etc/timezone' \;
    emerge --config timezone-data

# Other

    sudo sh -c "layman --sync-all && emerge --sync && eix-update"
    find /etc -iname "._cfg????_*" 2> /dev/null
    CCACHE_DIR="/var/tmp/ccache" ccache -s
    eselect kernel list
    eselect kernel set 1
    eselect news list
    portageq owners / /usr/share/aclocal/vala.m4

<!-- Created: 10 Jul 2009. -->
