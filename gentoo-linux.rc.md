# Gentoo Linux

## Installation

Install via clone/copy all system from source device to destination device.

### Copy MBR partitions

Copy partitions table from `/dev/your_source` to `/dev/your_destination`
<http://unix.stackexchange.com/questions/93385/how-to-restore-the-partition-layout-for-gpt-disk#93391>.

    sgdisk --replicate=/dev/your_destination /dev/your_source

#### Make unique its GUID as it was cloned and is identical with source device

    sgdisk --randomize-guids /dev/your_destination

### Copy raw partitions byte by byte

Cloning the all partitions one by one and the all their content

* <https://wiki.archlinux.org/index.php/Disk_cloning>
* <http://askubuntu.com/questions/173907/when-cloning-ext4-partition-with-the-dd-command-to-a-bigger-partition-free-spa#173968>
* <https://linode.com/docs/migrate-to-linode/disk-images/copying-a-disk-image-to-a-different-account#copying-the-disk-image>

    dd if=/dev/your_source1 of=/dev/your_destination1 bs=512 conv=sync

### GRUB

<https://wiki.gentoo.org/wiki/GRUB2#BIOS_with_MBR>

#### Mount `boot` partition

    mount /dev/your_destination1 /boot

#### Install GRUB

    grub-install /dev/your_destination

## Emerge

    MAKEOPTS="-j1" USE="-mmx" emerge --ask --oneshot your-pkg/name
    emerge --verbose --search emacs
    emerge --prune gentoo-sources
    emerge --verbose --ask --deep --noreplace =gentoo-sources-2.6.30-r4
    emerge --info

### Update

#### With build time dependencies

<https://www.gentoo.org/proj/en/portage/doc/faq.xml?style=printable#doc_chap1_sect2>

    emerge --color=y --oneshot --deep --newuse --update \
           --backtrack=1000000 --with-bdeps=y @world

#### Exclude

    emerge --update --exclude you-whant/to-exclude-package -- world

#### Kernel modules

<http://wiki.gentoo.org/wiki/Kernel/Upgrade#Reinstall_external_kernel_modules>

    emerge --oneshot @module-rebuild

### Recompile

Recompiling all packages on the system.

    emerge --emptytree system
    emerge --emptytree world

#### Recompile with notification

    export subj="$(hostname): Emerge empty tree system $(date --utc +%Y%m%dT%H%M%SZ)" && \
           emerge --emptytree --oneshot system; \
           echo -e "Subject: $subj\n\n$subj\n" | \
           /usr/sbin/sendmail your.name@your.tld

### Unmerge

    emerge --oneshot --deep --depclean your-pkg/name

#### Temporary

Remove/delete

    emerge --oneshot --unmerge your-pkg/name

### Ceanup all

    emerge --quiet --deep --depclean

### Format output

Output by columns (only package name)

    emerge --columns | awk '{print $4}'

## Profile

<https://wiki.gentoo.org/wiki/Profile_(Portage)>

List Gentoo profiles

    eselect profile list

## Equery

    equery list nginx
    equery list "*" |wc -l
    equery files alsa-lib
    equery depends your-pkg/name
    equery uses =emacs-22.3-r2 --all

### Files belong to package

    equery belongs /usr/share/fonts/misc/9x18.pcf.gz

same as:

    qfile /usr/share/fonts/misc/9x18.pcf.gz

### Packages depends on package

List packages depends on package `your-pkg/name`
<https://wiki.gentoo.org/wiki/Equery#Listing_all_packages_depending_on_a_package_with_depends_.28d.29>

    equery depends your-pkg/name

## Portage-utils

    qsize emacs
    qsize -a -k | sort -n -k 6
    qdepends --all media-fonts/font-misc-misc
    qlist emacs
    quse nls
    qsearch emacs
    emaint --check world

## USE flags

    equery hasuse ogg
    grep -i "ogg - " /usr/portage/profiles/use.desc
    grep -i "ogg - " /usr/portage/profiles/use.local.desc
    euse --info ogg
    equery uses =sys-devel/gcc-4.6.0

## Layman

* <http://gentoo.org/proj/en/overlays/userguide.xml?style=printable#doc_chap2_sect2>
* <http://en.gentoo-wiki.com/wiki/Overlay#Layman>
* <http://overlays.gentoo.org/proj/sunrise>

    layman --list
    layman --list-local
    layman --add=sunrise
    layman --delete=sunrise
    layman --sync=sunrise

## Ebuild

### Compile

    ebuild ~/path/to/ebuild/skippy-xd-0.5.0-r1.ebuild compile

### Install

    ebuild ~/path/to/ebuild/skippy-xd-0.5.0-r1.ebuild install

### [Ebuild policy][]

[Ebuild policy]: <http://gentoo.org/proj/en/devrel/handbook/handbook.xml?style=printable&part=3&chap=1>

### [Manifest][]

[Manifest]: <http://devmanual.gentoo.org/general-concepts/manifest/index.html>

    ebuild msort-8.53.ebuild manifest

## eix

    eix -vAS dev-ruby
    eix --world --categor
    eix-test-obsolete detail

### Cache refresh

    eix-update

### Downgrade (delete) or upgrade list

    eix --upgrade

### Overlays

List packages install from overlay <http://bugs.gentoo.org/204324>,
<http://bugs.gentoo.org/138622>.

    eix --installed-overlay
    eix --in-overlay unity-gentoo

#### Recompile all ebuilds from overlay

    emerge --verbose --oneshot $(eix --installed --only-names --in-overlay unity-gentoo)

#### Installed

Installed packages

##### List

    eix-installed -a

##### Count

Count all packages

    eix --installed --compact | grep Found.*matches

#### Deprecated

Installed packages and listed in overlay (this command counts then
twice) might be installed from overlay

    equery list -o | sort | uniq --count | sort --numeric-sort

### List packages in loop

    read -ra arr <<<"you/first-pkg your/second-pkg" && for i in "${arr[@]}"; do eix "$i"; done

## repoman

    repoman manifest
    repoman full --without-mask --include-dev

## GCC

### Upgrade

<https://wiki.gentoo.org/wiki/Upgrading_GCC#Short_version>

#### Rebuild

<https://wiki.gentoo.org/wiki/Upgrading_GCC#Which_packages_are_known_to_need_a_rebuild.3F>

    emerge --ask --oneshot --verbose sys-devel/libtool sys-devel/llvm

### Other

Symptom: `checking whether the C compiler works... no`

    gcc-config --list-profiles
    gcc-config 2

## Freeing Up Disk Space

WARNING: Avoid using eclean!
<http://makuro.wordpress.com/2010/12/12/intro-to-portage-sets>.

* <https://wiki.gentoo.org/wiki/Knowledge_Base:Freeing_disk_space>
* <https://wiki.gentoo.org/wiki/Knowledge_Base:Remove_obsoleted_distfiles>
* <https://wiki.gentoo.org/wiki/Eclean>
* <https://wiki.gentoo.org/wiki/Kernel/Removal>

    eclean distfiles
    eclean-dist --deep
    rm -rf /var/tmp/portage

<http://en.gentoo-wiki.com/wiki/Freeing_Up_Disk_Space#Removing_Ancient_Distfiles_and_Binaries>

## TAB-Completion

<https://wiki.gentoo.org/wiki/Bash#Tab_completion>

### List

    eselect bashcomp list --global

### Enable

    eselect bashcomp enable --global {0..703}

## Fix

Fix broken completions
<https://www.gentoo.org/support/news-items/2014-11-25-bash-completion-2_1-r90.html>

    find /usr/share/bash-completion -maxdepth 1 -type f \
      '!' -name 'bash_completion' -exec emerge -1v {} +

## Updates

### Perl cleans all packages

* <http://www.gentoo.org/proj/en/perl/perl-cleaner.xml?style=printable>
* <http://wiki.gentoo.org/wiki/Project:Perl/perl-cleaner>

    emerge --nodeps dev-lang/perl
    perl-cleaner --all

### Python

    eselect python set --python2 python2.7
    eselect python set --python3 python3.3

### Other

Update/upgrade

    emacs-updater
    haskell-updater

### udept

Clean out your world file
<http://forums.gentoo.org/viewtopic-t-142475.html>.

    dep --pretend --pruneworld

## Init

### Status

    /etc/init.d/your_service status
    rc-service your_service status

### Start

    /etc/init.d/your_service start
    rc-service your_service start

### Stop

    /etc/init.d/your_service stop
    rc-service your_service stop

## Runlevels

Run levels (start at boot)

    rc-update -v show
    rc-update add xdm default
    rc-update del xdm default
    rc-status

## La files

    lafilefixer --justfixit

<https://bugs.gentoo.org/show_bug.cgi?id=437084#c4>

    sudo sh -c 'env-update && source /etc/profile'

## Merge configuration

### First

    dispatch-conf

### Second

    etc-update

## Netfilter

<http://wiki.gentoo.org/wiki/Iptables#Firewall>

Rules saved to `/var/lib/$ipt/rules-save` and will be loaded
with `/etc/init.d/$ipt` when machine is powered on.

### iptables

    /etc/init.d/iptables save
    /etc/init.d/iptables start

### ip6tables

    /etc/init.d/ip6tables save
    /etc/init.d/ip6tables start

## Rebuilding

    emerge @preserved-rebuild && revdep-rebuild

### revdep-rebuild

    revdep-rebuild --pretend
    revdep-rebuild --ignore
    revdep-rebuild --verbose --pretend --library libreadline.so.5

## Set UTC time zone

<https://wiki.gentoo.org/wiki/System_time#OpenRC>

    find /usr/share/zoneinfo -maxdepth 1 -type f -name UTC \
         -exec sh -c 'echo {} | sed "s|^/usr/share/zoneinfo/||" > /etc/timezone' \;
    emerge --config timezone-data

## ccache

### Show

    CCACHE_DIR="/var/tmp/ccache" ccache --show-stats

### Clear

    CCACHE_DIR="/var/tmp/ccache" ccache --clear

## PostgreSQL

<https://wiki.gentoo.org/wiki/PostgreSQL/QuickStart#Preparing_to_Initialize_the_Database_Cluster>

    emerge --config dev-db/postgresql:12.3

## Gnome applet

* https://packages.gentoo.org/packages/gnome-extra/nm-applet
* https://faq.i3wm.org/question/2/how-can-i-use-networkmanager-with-i3.1.html

## To investigate

* https://wiki.gentoo.org/wiki/Distcc copile on first host and distribute binary to the second host

## Other

    sudo sh -c "layman --sync-all && emerge --sync && eix-update"
    find /etc -iname "._cfg????_*" 2> /dev/null
    eselect kernel list
    eselect kernel set 1
    eselect news list
    portageq owners / /usr/share/aclocal/vala.m4
