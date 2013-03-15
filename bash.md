<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

Bash
====

Manuals
-------

    man 1 -L en -P "less -I" ls
    man -k sex
    man share/man/man1/ruby.1
    apropos
    whatis


Count lines
-----------

    ls -x1 /usr/lib |wc -l

http://stackoverflow.com/questions/1427032/fast-linux-file-count-for-a-large-number-of-files

    ls -f | wc -l

Search and replace
------------------

### grep

    grep -R eth0 /etc
    grep -irl danil . 2> /dev/null | xargs tar cvvf ~/tmp/123.tar

### pcregrep

* Multiple lines matching
  <http://stackoverflow.com/questions/2686147/how-to-find-patterns-across-multiple-lines-using-grep#answer-2686705>
  <http://stackoverflow.com/questions/3863792/an-ack-or-grep-regex-to-match-two-lines-that-are-nearly-the-same#answer-3864440>
* Perl-compatible regex

    pcregrep -M  'abc.*(\n|.)*efg' test.txt

### find

    find ~/ -mount -type f -size -100k -iname "*.rb" \
            -exec grep -q -e danil\\.kutkevich \{\} \;
    find "/etc/" -mount -maxdepth 3 -type f -size -100k -name "*.conf" \
     |xargs grep -ilE "192\.168\.1\.[0-9]+"
    find ./ -type d -exec chmod 755 '{}' \;
    find ./ -type f |while read I; do \
        NEWNAME1=$( md5sum "$I" |cut -d " " -f 1 ); \
        NEWNAME2=$(dirname "$I")/$NEWNAME1_$( basename "$I"); \
        mv "$I" "$NEWNAME2"; done;

#### Search and remove file with inode number

<http://unix.com/solaris/23278-file-no-name.html>
<http://www.cyberciti.biz/tips/delete-remove-files-with-inode-number.html>

    ls -il /var/ftp/incoming
    find /var/ftp/incoming -inum [inode-number] -exec rm {} \;

#### Recreate symlinks

    find / -type l -exec sh -c 'lname="{}"; ltarget=$(readlink "${lname}"); rm "${lname}"; ln -s "${ltarget}" "${lname}"' \;

### ack

    ack Webpage ~/src/jobtest-aviasales-ru/

#### Search for file name

    ack --all-types -g [a-z]+array

#### Only print filenames containing matches

    ack --files-with-matches "{{" config/

### The silver searcher

<https://github.com/ggreer/the_silver_searcher>

    ag Webpage ~/src/jobtest-aviasales-ru/

#### Search for file name

    ag --all-types -g [a-z]+array

#### Only print filenames containing matches

    ag --files-with-matches "{{" config/

### Remove empty dirs

    find -depth -type d -empty -exec rmdir {} \;

    find ./ -mount -type f -iname "*~" -exec rm {} \;
    find /lib/modules/2.6.30/ -type f -iname '*.o' -or -iname '*.ko'

### sed

Stream Editor

    find ./ -type f -iregex ".*e?rb" -exec sed -i -r \
         -e 's|http://tinyerp\.(org\|com)(/edoc)?/?|./|g' '{}' \;
    echo 'Hello, World!' |sed -e s/World/work/
    svn status |grep '^[I?]' |sed 's/^[I?]//' |xargs rm -rf

#### Remove the 7rd line

    sed -i '7d' ~/.ssh/known_hosts

### AWK

    awk '{ FS = "\t" ; OFS = "\t" ; print $1,"ru",$2,$3 }' \
        infile > outfile
    awk '{ FS = "\t" ; OFS = "\t" ; if ( NR > 1 ) print $1,$3 }' \
        infile > outfile

### tr

#### Convert uppercase to lowercase

<http://cyberciti.biz/faq/linux-unix-shell-programming-converting-lowercase-uppercase>

    tr '[:upper:]' '[:lower:]' < input.txt > output.txt

#### Replacing returns with space

    cat ./file |tr '\n' ' '

#### Config dryup

    cat /etc/ntp.conf | grep -v '^#'| grep -v '^$'


Truncate text file
------------------

Blank file content.

<http://cyberciti.biz/faq/truncate-large-text-file-in-unix-linux>.

    > {filename}

xargs
-----

    ack -a -g . |xargs -I % sh -c 'echo -e "\n\n########### %\n" && cat %' > 123

Date and time
-------------

    date +%z
    date -s "2008-04-30 08:48:0" # YYYY-mm-dd HH:MM:S (ISO 8601).
    date -s "041501482008" # mmddHHMMYYYY (OpenWRT).
    tzselect # Show what value to use for TZ environment variable.

### Hardware clock (RTC)

<http://en.qi-hardware.com/wiki/Ben_NanoNote_TimeZone_Date_and_Calendar_HOWTO>

    hwclock --systohc --localtime

### ntpdate

    ntpdate -u -d 192.168.91.2

### ntpd

    ntpdc -c sysinfo -n # Stratum 3 is good enough.
    ntpq -c readvar
    ntpq -c peers

env
---

    env LANG=ru_RU.UTF-8 xedit
    export LANG=ru_RU.KOI8-R

To clear the environment:

    env -i /bin/sh

Network
-------

    ngrep -d lo |less

### Used ports

    netstat -tnlp

### Remote shell

    telnet mail.omskportal.ru 25

### Telnet

    busybox telnet molinos.megaplan.ru 80

### SSH

    ssh -t root@santaslittlehelper "ssh danil@homer"
    scp -P 61022 [-r] foo.tar.gz bar.tar.gz anonymous@kutkevich.org:/home/danil/
    ssh-keygen -t rsa
    ssh-copy-id -i ~/.ssh/id_rsa.pub "anonymous@kutkevich.org -p 2000"
    sshfs -p 61022 kutkevich.org:/home/danil/ mnt/kutkevich_org/

#### SSH tunneling

<http://revsys.com/writings/quicktips/ssh-tunnel.html>

    ssh -f root@stampy -L 2000:homer:22 -N
    ssh -p 2000 danil@localhost

### Nmap

Discover (scanner) hosts and services on a computer network.

    nmap --open 217.197.232.218
    nmap -sP 192.168.0.0/16

ACPI
----

    grep bogo /proc/cpuinfo
    grep -E "charging|remaining" /proc/acpi/battery/BAT0/state
    cpufreq-info
    cat /proc/acpi/ac_adapter/AC/state
    cat /proc/acpi/thermal_zone/THR0/temperature
    cat /sys/class/power_supply
    cat /sys/devices/system/cpu/cpu1/online
    cat /proc/cmdline
    zcat /proc/config.gz |grep CONFIG_SYSVIPC

diff
----

    colordiff --ignore-space-change postgresql-8.4 ._cfg0000_postgresql-8.4

### Compare directories

<http://linuxcommando.blogspot.com/2008/05/compare-directories-using-diff-in-linux.html>

    diff --recursive --brief ~/dir1 ~/dir2| grep Only
    colordiff --recursive prealpha.kutkevich-org/ alpha.kutkevich-org/

### Prepare patch

<http://devmanual.gentoo.org/tools-reference/diff-and-patch>

    diff -u foo.c.~master~ foo.c


Archiving and compression
-------------------------

### Tar

    tar -xvvzf foobar.tar.gz

### Gzip

    gzip -v access.log
    gzip -vd access.log.gz

### Bzip2

    bzip2 -v access.log
    bzip2 -vd access.log.gz

### Zip

    zip file-to-archive.zip file-to-archive
    zip -r foo.zip foo/
    unzip foo.zip

### RAR

    unrar x file.rar

Power Management
----------------

    hibernate-ram
    hibernate

Mail
----

<http://debian-administration.org/article/171/Send_an_HTML_file_as_email_from_the_command_line>

    mail -a "Content-type: text/html;" \
         -s "Employer" \
         danil@kutkevich.org < ./htdocs/index.html

    echo 'Hello, work' |mail -s 'Hello, World!' anonymous@kutkevich.org
    /usr/sbin/sendmail -bV
    exim -brw danil
    exim -bV
    mailq
    exim -Mvl <message_id>

Random
------

### String generator

    dd if=/dev/random bs=1 count=16 |base64

### Password

#### Range from 5 to 9 length

    pwgen $(( 5+(`od -An -N2 -i /dev/random` )%(9-5+1) )) 1

#### To file

    pwgen --numerals --secure --no-capitalize 10 80000 \
      | tr '[:lower:]' '[:upper:]' > 80k_upper_201210091031

#### Test for duplicates

<http://stackoverflow.com/questions/6447473/linux-command-or-script-counting-duplicated-lines-in-a-text-file#6447515>

    cat 80k_upper_20120723 20k_upper_201210091031  \
      | sort | uniq -c | grep ' 1 ' --invert-match

### Other

    dd if=/dev/urandom count=1 2> /dev/null \
     | uuencode -m - \
     | sed -ne 2p \
     | cut -c-8

Kernel modules
--------------

    lsmod |grep vb
    rmmod vboxdrv
    modprobe vboxdrv

Images
------

### View

    feh --draw-filename --sort name --recursive --thumbnails --fullscreen ~/tmp

### ImageMagick

    convert ~/tmp/screenshot.png -quality 30 ~/tmp/screenshot.jpg

Character encodings
-------------------

    convmv -f windows-1251 -t utf-8 *.* --notest -r
    iconv -fWINDOWS-1251 -tUTF-8 -ooutfile infile
    dos2unix filename

### Find ASCII/UTF-8 text files

    ack -g . . |xargs file * |grep UTF

locate
------

    locate cvs |grep bin
    updatedb

rsync
-----

    rsync -rv --stats --delete --compress --skip-compress=jpg,gif,png,mp4 \
      danil@kutkevich.org:~/foo/bar foo

### bwlimit

Limit disk I/O
http://www.cyberciti.biz/faq/throttle-disk-io-rate-limit-disk-io

    rsync --delete --numeric-ids --relative --delete-excluded --bwlimit=10000 /path/to/source /path/to/dest/

Disk
----

    dd if=/dev/cdrom of=myimage.iso
    dd if=/dev/sdb of=mybackup.img bs=130M count=1
    dd if=bootldr.rom of=/dev/sdb
    dd if=debian-eeepc.img of=/dev/sdf
    bchunk Dungeon_Keeper.BIN Dungeon_Keeper.cue Dungeon_Keeper.iso
    modprobe loop && mount -t iso9660 -o loop tmp/fdfullcd.iso mnt/iso
    mount -t vfat /dev/sdc1 mnt/usbdisk/ \
          -o uid=danil,gid=danil,nosuid,shortname=mixed,umask=077
    mount -t ext2 ~/restore.img /mnt/img -o ro,loop,offset=32256
    mount -t cifs "//192.168.91.3/store (e)" mnt/black_server/ \
          -o "workgroup=darout,username=danil,iocharset=utf8,codepage=cp1251"
    mount --rbind olddir newdir
    df -hi
    du -hx ./ |grep -E ^[0-9.,]+[MG]
    find  -ctime +30 -daystart -type d \
      | xargs du -b 2>/dev/null \
      | awk '{total += $1; print $0} END{print total}'
    fsck /dev/sdg1
    touch /forcefsck

### Disk formatting

    fdisk -l /dev/sdb
    sfdisk -l -uM
    cfdisk
    tune2fs
    mkswap /dev/sda7 && swapon /dev/sda7
    swapon -s
    swapoff -a

#### mke2fs

    mkfs.ext2 -L fs_boot /dev/sde1
    mkfs.vfat -F 32 /dev/sdg1

##### Set number of inodes

    mkfs.ext4 -N 1000432 /dev/sda5

<http://stackoverflow.com/questions/3618820/how-many-bytes-per-inodes>.

    tune2fs -l /dev/sda5 | grep Inode

Free ram
--------

<http://linuxatemyram.com>

    free -m

Job control
-----------

<http://stackoverflow.com/questions/11821378/what-does-bashno-job-control-in-this-shell-mean#11824420>

* `jobs` list running jobs
*    `%` foreground recently job

Other
-----

    mkdir ~/root/{var/{db/pkg,paludis/distfiles,cache/paludis/{names_cache,write_cache},tmp/paludis}
    uname -a
    hostname -f
    id
    ls -altc
    whereis vsftpd
    alias
    echo -e "1\n2"
    echo -n "Some text line"; echo -en "all the same text line.\n"
    md5sum -c ./file
    echo "1539bad48e984ae1441052dc074c0995  /dev/hdc" |md5sum -c
    echo "26733b170052a01eb48ed2d5495a5cb51c00bdd0 /dev/hdc" |sha1sum -c
    gpg --keyserver subkeys.pgp.net --recv-keys 17072058
    gpg --verify <signature file> <downloaded iso>
    cal -3
    time tar -cvvzf foobar.tar.gz ./lib/ ./mobotix/ /usr/share/doc/
    cp -a ~/var/www/ ~/tmp/
    top -b -n1 |grep wpa
    uptime # load average: <last minute>, <last 5 minutes>, <15 minutes>
    hdparm -tT /dev/sda
    vmstat
    iostat
    cat /etc/passwd
    cat /etc/group
    grep MemTotal /proc/meminfo
    emacs /boot/grub/menu.lst
    less -IS ./access.log
    tail -f ./access.log
    head ./access.log
    strings binary.pdf
    cat /proc/modules
    sort ./file
    cat list-1 list-2 list-3 |sort |uniq > final.list
    msort --quiet --line \
          --position 2 ---field-separators "\t" --comparison-type l \
          --tag "][(][a-z]+://" bookmark.md
    msort --quiet --line \
          --tag "${id_attribute}=" --comparison-type n \
          --tag 'HTTP_X_REAL_IP="' --comparison-type h \
          --tag HTTP_USER_AGENT= \
          --tag Time= \
          unsortedfile > file
    expand # Converts tabs to spaces.
    unexpand # Converts spaces to tabs.
    ps auxf
    rm -r foo.tar.gz bar.tar.gz la/
    file ./index.html
    who
    cat > /sbin/traff_graph # C-d to save the file.
    fmt FILE # Reformat each paragraph in the FILE.
    ln -s TARGET [LINK_NAME]
    touch access.log error.log
    dmesg |tail -n 25 # Diagnostic message.
    lspci
    lsusb
    ethtool -i eth0
    nohup iceweasel
    setterm -blength 0
    tput colors
    curl -o ruby.png http://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/100px-Ruby_logo.svg.png
    curl -v -H "Accept: application/xrds+xml" -X HEAD http://www.yahoo.com/
    wget ftp://anonymous@kutkevich.org/pub/ruby-1.8.7-p72.tar.gz
    wget -c -t inf --waitretry=30 -b --retry-connrefused \
         [-O output_file ] "ftp://192.168.1.1/file"
    wget --recursive --level=0 --restrict-file-names=nocontrol \
         --convert-links "http://tinyerp.org/edoc/"
    wget --load-cookies=cookies.txt --recursive --domains=www.prohq.ru,prohq.ru --level=999 --restrict-file-names=nocontrol --ignore-tags=img http://www.prohq.ru
    wget --page-requisites \
         --convert-links \
         --reject "robots.txt" \
         http://localhost:3000/maillists-invitations-contractor.html
    rtorrent -s ./.rtorrent
    host 192.168.132.44 192.168.8.1
    nslookup 172.16.81.4
    whois kutkevich.org
    dig kutkevich.org
    ifconfig -a
    ifconfig eth0 192.168.0.2
    ifconfig eth0.1 hw ether 00:1D:7E:55:19:D9
    dhclient
    ip r
    route del default gw 192.168.28.1 ath0
    route {add|del} [default] [gw 192.168.0.1] -net 172.16.0.0 \
          netmask 255.255.0.0 dev ppp0
    echo "1" > /proc/sys/net/ipv4/ip_forward
    pon darout
    poff darout
    iwlist ath0 scanning
    iwconfig ath0 essid John
    iwconfig ath0 key s:dfvgbh1234567
    killall wpa_supplicant && sleep 5 \
     && wpa_supplicant -i ath0 -c /etc/wpa_supplicant/wpa_supplicant.conf
    wvdial megafon
    curlftpfs -o "user=danil" kutkevich.org mnt/kutkevich_org/
    smbtree [-N] -d 2
    smbclient [-N] -L server
    smbclient -N "\\\\server\\store (e)"
    smbmount "//172.16.84.14/d$" mnt/cdp0002 \
     -o workgroup=darout,username=dkutkevich,iocharset=UTF-8,codepage=windows-1251
    rdesktop -g 99% -k en 192.168.91.5
    sudo -u nobody ls
    chroot /mnt/gentoo /bin/bash
    env-update && source /etc/profile
    # 6177657266 (64bit WEP key)
    echo -n 'awerf' |hexdump -e '5/1 "%02x" "\n"' \
         |cut -d ':' -f 1-5
    # 786468646b6b6577696f646464 (128bit WEP key)
    echo -n 'xdhdkkewioddd' |hexdump -e '13/1 "%02x" "\n"' \
         |cut -d ':' -f 1-13
    update-rc.d nginx defaults
    update-rc.d -f nginx remove
    nohup ./scripts/bootstrap.sh &
    cdrecord dev=/dev/hdc <downloaded iso file>
    PAGER=cat man man
    vlc -I ncurses
    vobcopy
    evolution --force-shutdown
    sloccount .
    xmodmap ~/.Xmodmap
    xmodmap -pke > .xmodmap.orig
    tput cols && tput lines

DCTC
----

    dctc -n danil -s /home/danil/tmp/_video/ -f -g worm.interzet.ru:411
    rccp -H dctc-00006D13-worm.interzet.ru:411 -s lalala

    # Create a file of any given size.
    dd if=/dev/zero of=bigfile bs=1024 count=1048576

Wine
----

    cabextract file.cab
    msiexec /i file.msi
    wine start FluffyBunnySetup.msi

Users and groups
----------------

    chmod -R ug+w ./smarty/templates_c/ ./smarty/cach/
    chown -R www-data:www-data ./smarty/templates_c/ ./smarty/cache/
    groups danil
    groupadd danil
    groupmod -n new_group_name danil
    gpasswd -a danil audio
    groupdel danil
    delgroup --only-if-empty danil
    useradd -D
    useradd --comment "Danil Kutkevich" --user-group --groups fuse,cvs \
            --create-home --base-dir /home/.rails/ --shell /bin/bash danil
    usermod -c "Danil Kutkevich" -d /home/danil -m \
            -g danil -G fuse,cvs -a -l danil -s /bin/bash danil
    userdel -r danil
    deluser --remove-all-files --backup --backup-to /home/danil/ danil
    passwd danil
    grpck

APT
---

Advanced Packaging Tool

    apt-get update
    apt-get -u upgrade
    apt-get -u dist-upgrade
    apt-cash [--full] search emacs
    apt-cash show emacs
    apt-cache depends penguin-command
    apt-get -t testing install emacs22-nox
    apt-get --purge remove xyz
    apt-get clean
    apt-cdrom [-d /home/danil/mnt/cdrom] add

### Finding which package contains a file

<http://debian-administration.org/articles/334>

    apt-file update
    apt-file search stdio.h

    apt-key add archive-key-eeepc.asc
    apt-mark unmarkauto
    reprepro
    dpkg-scanpackages
    wget -O - http://backports.org/debian/archive.key |apt-key add -
    aptitude -P clean
    aptitude -P update
    aptitude -P safe-upgrade
    aptitude -P full-upgrade
    aptitude -P purge ~c
    aptitude search . |grep "^i   " \
                      |awk '{ FS = " " ; OFS = " " ; print $2 }' \
                      |less -SI
    aptitude show catdoc

Debian package
--------------

    dpkg -l emacs*
    dpkg -L emacs21-nox
    dpkg -S stdio.h
    dpkg-architecture
    dpkg-reconfigure xserver-xorg locales
    dpkg -x xlibs_4.3.0.dfsg.1-14sarge7_all.deb ./

RPM
---

Red Hat Package Manager

    rpm -qa |grep -i emacs
    rpm -qfa |grep -i xyz\.so
    rpm -ihv emacs
    rpm -Uhv emacs
    rpm -e package

Yellowdog Updater Modified
--------------------------

    yum list emacs\*
    yum search PalmPilot
    yum install emacs
    yum groupinstall "MySQL Database"
    yum update emacs
    yum groupupdate "MySQL Database"
    yum remove emacs
    yum groupremove "MySQL Database"

X
---

### Restart X

In a tty terminal, not a terminal window (get there with [Ctrl] +
[Alt] + [F1]).

    /etc/init.d/xdm stop

### Hardware information for VESA PnP monitors

    get-edid |parse-edid

### DPI and display size

    xdpyinfo | grep "dots per inch"
    xdpyinfo | grep dimensions

### xautolock

    xautolock -disable


### Default applications

* <https://wiki.archlinux.org/index.php/Default_Applications>
* <https://wiki.archlinux.org/index.php/Xdg-open>

    xdg-open ~/Downloads/tasks.csv

### GNU Screen

    screen btdownloadcurses some.torrent
    screen -S debian_torrent
    screen -r <PID> # Reconnect to screen.
    screen -RD
    screen -x debian_torrent # Reconnect to screen.

#### Scrollback or copy mode

<http://superuser.com/questions/138748/how-to-scroll-up-and-look-at-data-in-gnu-screen>.

* To enter hit the prefix key and, then `[`
* Escape to exit.

### Change monitor resolution

    xrandr
    xrandr -s 1440x900

### stdout to clipboard

<http://cyberciti.biz/faq/xclip-linux-insert-files-command-output-intoclipboard>.

    cat /var/tmp/portage/unity-base/bamf-0.2.118/temp/build.log | xsel

### Other

    echo "lalala" |xclip -selection clip
    echo -en "trulala" | xsel -i -b -p
    xev
    xset b off
    xrdb -merge ~/.Xresources
    xrdb -merge ~/.Xdefaults
    xinit `which nice` -n 1 `which wine` "./falloutw.exe" -- :1 -depth 16
    xclock &
    xdg-open micronika.xls
    xvidtune
    xdpyinfo |grep "depth of root"
    xrandr # .xinitc, .xsesson, .gnomerc
    ./configure --prefix=$HOME --with-baseruby="/home/danil/bin/ruby" \
                --enable-shared --enable-pthread --enable-install-doc
    su -c make -f Makefile.cvs install
    make && make install
    make menuconfig # make oldconfig
    echo $?
    gimptool-2.0 --install-script ~/Downloads/multiscale_0.scm
    notify-send --urgency=low --hint=int:x:1390 --hint=int:y:800 --expire-time=900 '2' 'Desktop'"

ALSA
----

ALSA sound cards start with 0, so 0 is the first card, 1 is the second
card, etc.

    alsamixer -c 0

CentOS
------

    setup

nginx
-----

    nginx -t -c nginx.conf

Apache
------

    htpasswd -c /home/danil/.htpasswd danil
    apache2ctl -t -D DUMP_MODULES # Show the loaded modules.
    a2enmod proxy_balancer
    a2dismod php5
    a2ensite kutkevich.org
    a2dissite example.org
    ab -kc 10 -t 30 http://kutkevich.org

    httperf --num-conns 10 --rate 120 \
            --server kutkevich.org --port 80 --uri /index.html
    httperf --num-conns 10 --rate 120 \
            --server kutkevich.org --port 80 --wsesslog=10,1,wsesslog_ska

iptables
--------

    iptables -L traffic -vx
    iptables -t nat -A POSTROUTING -o eth0 \
             -s 192.168.0.202/32 -j MASQUERADE

mpd
---

    mpc clear
    mpd --create-db
    mpc add /
    mpc ls |mpc add
    mpc play
    mpc save p

GTK
---

    gconftool-2 --set /apps/nautilus/desktop/computer_icon_visible --type boolean false
    gconftool-2 --set /desktop/gnome/url-handlers/http/command -t string 'firefox %s'
    gconftool-2 --set /desktop/gnome/url-handlers/https/command -t string 'firefox %s'

upsc
----

Network UPS Tools (NUT) <http://en.gentoo-wiki.com/wiki/NUT>.

    upsc ippon@localhost

Keyboard shortcut
-----------------

* `C-r` reverse search history
* `C-s` pausing all output on the terminal
* `C-q` resume output on the terminal

Files
-----

    /etc/acpi/actions/suspend.sh

VirtualBox
----------

    mount -t vboxsf -o uid=1000,gid=1000 share ~/mnt/share
    VBoxManage clonevdi xp_ie7.vdi xp_ie8.vd


Converting flac to mp3
----------------------

<http://linuxtutorialblog.com/post/solution-converting-flac-to-mp3>

    for file in *.flac; do flac -cd "$file" | lame -h - "${file%.flac}.mp3"; done
