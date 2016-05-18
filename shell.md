# Shell

# Escape single quotes

Escape single quotes within single quotes
<http://stackoverflow.com/questions/1250079/how-to-escape-single-quotes-within-single-quoted-strings>

    echo 'Here'"'"'s my test...'
    echo 'Here'\''s my test...'

# Count lines

    ls -x1 /usr/lib | wc -l

<http://stackoverflow.com/questions/1427032/fast-linux-file-count-for-a-large-number-of-files>

    ls -f | wc -l

# Rename

## Remove spaces

Remove spaces from filenames in current directory

    rename -n 's/[\s]/''/g' *

## To lowercase

Change capitals to lowercase in filenames in current directory

    rename 'y/A-Z/a-z/' *

## Whitespaces by underscores

Rename files <http://stackoverflow.com/questions/2709458/bash-script-to-replace-spaces-in-file-names#2709619>.

### Directories

    find -name "* *" -type d | perl-rename 's/\s/_/g'

### Files

    find -name "* *" -type f | perl-rename 's/\s/_/g'

# Truncate text file

Blank file content.

<http://cyberciti.biz/faq/truncate-large-text-file-in-unix-linux>.

    echo > {filename}

# Date and time

    date +%Y%m%d%H%M%S #19700101000000
    date +%z
    date --iso-8601=seconds #2014-08-15T16:40:09+0400
    tzselect #show what value to use for TZ environment variable

## Set

    date -s "2008-04-30 08:48:0" # YYYY-mm-dd HH:MM:S (ISO 8601).
    date -s "041501482008" # mmddHHMMYYYY (OpenWRT).

## Hardware clock (RTC)

<http://en.qi-hardware.com/wiki/Ben_NanoNote_TimeZone_Date_and_Calendar_HOWTO>

    hwclock --systohc --localtime

## ntpdate

    ntpdate -u -d 192.168.91.2

## ntpd

    ntpdc -c sysinfo -n # Stratum 3 is good enough.
    ntpq -c readvar
    ntpq -c peers

# env

    env LANG=ru_RU.UTF-8 xedit
    export LANG=ru_RU.KOI8-R

## Clear environment

To clear the environment and start bash

    env --ignore-environment /bin/bash

# ACPI

    grep bogo /proc/cpuinfo
    grep -E "charging|remaining" /proc/acpi/battery/BAT0/state
    cpufreq-info
    cat /proc/acpi/ac_adapter/AC/state
    cat /proc/acpi/thermal_zone/THR0/temperature
    cat /sys/class/power_supply
    cat /sys/devices/system/cpu/cpu1/online
    cat /proc/cmdline
    zcat /proc/config.gz | grep CONFIG_SYSVIPC

# diff

    colordiff --ignore-space-change postgresql-8.4 ._cfg0000_postgresql-8.4

## Compare directories

<http://linuxcommando.blogspot.com/2008/05/compare-directories-using-diff-in-linux.html>

    diff --recursive --brief ~/dir1 ~/dir2| grep Only
    colordiff --recursive prealpha.kutkevich-org/ alpha.kutkevich-org/

## Prepare patch

<http://devmanual.gentoo.org/tools-reference/diff-and-patch>

    diff --unified foo.c.~master~ foo.c

# Patch

## Apply patch

<http://cyberciti.biz/faq/appy-patch-file-using-patch-command/>

    patch -p1 < {/path/to/patch/file}

# Power Management

    hibernate-ram
    hibernate

# Random

## String generator

    dd if=/dev/random bs=1 count=16 |base64

# Sorting

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

# Bash history

## Print without line numbers

<http://stackoverflow.com/questions/7110119/bash-history-without-line-numbers#7110197>.

    history | cut -c 8-

## Remove duplicates in .bash_history

<http://unix.stackexchange.com/questions/48713/how-can-i-remove-duplicates-in-my-bash-history-preserving-order#48716>

    cat ~/.bash_history | nl | sort -k2 -k 1,1nr | uniq -f1 | sort -n | cut -f2

## Other

    dd if=/dev/urandom count=1 2> /dev/null \
     | uuencode -m - \
     | sed -ne 2p \
     | cut -c-8

# Kernel modules

    lsmod |grep vb
    rmmod vboxdrv
    modprobe vboxdrv

# Images

## View

    feh --draw-filename --sort name --recursive --thumbnails --fullscreen ~/tmp

# Character encodings

    convmv -f windows-1251 -t utf-8 *.* --notest -r
    iconv --from-code=WINDOWS-1251 --to-code=UTF-8 --output=outfile infile
    dos2unix filename

## Find ASCII/UTF-8 text files

    ack -g . . |xargs file * |grep UTF

# locate

    locate cvs |grep bin
    updatedb

## bwlimit

Limit disk I/O
http://www.cyberciti.biz/faq/throttle-disk-io-rate-limit-disk-io

    rsync --delete --numeric-ids --relative --delete-excluded --bwlimit=10000 /path/to/source /path/to/dest/

# Job control

<http://stackoverflow.com/questions/11821378/what-does-bashno-job-control-in-this-shell-mean#11824420>

* `jobs` list running jobs
*    `%` foreground recently job

# Sudo

    sudo -u nobody ls

# Su

## Execute command as another user

<http://stackoverflow.com/questions/6905697/how-to-run-script-as-another-user-without-password#6905797>

    sudo su -c "ls" -s /bin/sh ftp

# DCTC

    dctc -n danil -s /home/danil/tmp/_video/ -f -g worm.interzet.ru:411
    rccp -H dctc-00006D13-worm.interzet.ru:411 -s lalala

    # Create a file of any given size.
    dd if=/dev/zero of=bigfile bs=1024 count=1048576

# Wine

    cabextract file.cab
    msiexec /i file.msi
    wine start FluffyBunnySetup.msi

# Users and groups

    groups danil
    groupadd danil
    groupmod -n new_group_name danil
    gpasswd --add danil audio #and then `newgrp`
    groupdel danil
    delgroup --only-if-empty danil
    useradd -D
    useradd --comment "Danil Kutkevich" --user-group --groups fuse,cvs \
            --create-home --base-dir /home/.rails/ --shell /bin/bash danil
    usermod --comment "Danil Kutkevich" --home /home/danil --move-home \
            --groups fuse,cvs --append \
            --gid danil --login danil --shell /bin/bash danil
    userdel --remove danil
    grpck

# Password

## Set

    passwd your-user-name

## Delete

    passwd --delete your-user-name

## Other

    deluser --remove-all-files --backup --backup-to /home/danil/ danil

# chmod

    chmod -R ug+w ./smarty/templates_c/ ./smarty/cach/

## Fix files and directories permissions

<http://superuser.com/questions/126073/chmod-to-allow-read-and-write-permissions-for-directory#126075>

    find ./somedir \( -type d -exec chmod u=rwx,g=rx,o=xr {} \; \
                   -o -type f -exec chmod u=rw,g=r,o=r {} \; \)

# chown

    chown --recursive www-data:www-data ./smarty/templates_c/ ./smarty/cache/

# ALSA

ALSA sound cards start with 0, so 0 is the first card, 1 is the second
card, etc.

    alsamixer -c 0

# SoX

<http://en.wikipedia.org/wiki/SoX>.

## Play audio in background via command line

<http://askubuntu.com/questions/176038/how-can-i-play-a-song-in-the-background-via-my-command-line#176046>.

    play -q --no-show-progress ~/local/share/sounds/complete.oga &

# CentOS

    setup

# nginx

    nginx -t -c nginx.conf

# Apache

    htpasswd -c /home/danil/.htpasswd danil
    apache2ctl -t -D DUMP_MODULES # Show the loaded modules.
    a2enmod proxy_balancer
    a2dismod php5
    a2ensite kutkevich.org
    a2dissite example.org

# ab

    ab -kc 10 -t 30 http://kutkevich.org

# httperf

    httperf --num-conns 10 --rate 120 \
            --server kutkevich.org --port 80 --uri /index.html
    httperf --num-conns 10 --rate 120 \
            --server kutkevich.org --port 80 --wsesslog=10,1,wsesslog_ska

# siege

    siege --concurrent=1 --reps=1 --verbose \
          --log=$HOME/siege.log --file=$HOME/siege-urls \
          --header="Cookie: ring-session=00000000-0000-0000-0000-000000000000"

# iptables

    iptables -L traffic -vx
    iptables -t nat -A POSTROUTING -o eth0 \
             -s 192.168.0.202/32 -j MASQUERADE

# mpd

    mpc clear
    mpd --create-db
    mpc add /
    mpc ls |mpc add
    mpc play
    mpc save p

# GTK

## dconf

    dconf write /org/gnome/shell/overrides/button-layout "'close,minimize,maximize:'"

## gconf

    gconftool-2 --set /apps/nautilus/desktop/computer_icon_visible --type boolean false
    gconftool-2 --set /desktop/gnome/url-handlers/http/command --type string 'firefox %s'
    gconftool-2 --set /desktop/gnome/url-handlers/https/command --type string 'firefox %s'
    gconftool-2 --set /apps/metacity/general/button_layout --type string 'close,minimize,maximize:'
    gconftool-2 --set /desktop/gnome/shell/windows/button_layout --type string "close,minimize,maximize:"

# upsc

Network UPS Tools (NUT) <http://en.gentoo-wiki.com/wiki/NUT>.

    upsc ippon@localhost

# Keyboard shortcut

* `C-r` reverse search history
* `C-s` pausing all output on the terminal
* `C-q` resume output on the terminal

# Files

    /etc/acpi/actions/suspend.sh

# VirtualBox

    mount -t vboxsf -o uid=1000,gid=1000 share ~/mnt/share
    VBoxManage clonevdi xp_ie7.vdi xp_ie8.vd


# Puppet

    puppet puppet.pp

# Converting flac to mp3

<http://linuxtutorialblog.com/post/solution-converting-flac-to-mp3>

    for file in *.flac; do flac -cd "$file" | lame -h - "${file%.flac}.mp3"; done

# Hashing

## MD5

### Create

    md5sum FantasqueSansMono-Regular.ttf

### Check

    md5sum --check ./file
    echo '1539bad48e984ae1441052dc074c0995  /dev/hdc' | md5sum --check

## SHA-1

### Check

    echo '26733b170052a01eb48ed2d5495a5cb51c00bdd0 /dev/hdc' | sha1sum --check

# cp

## Preserving directory path

Copy file preserving directory path
<http://serverfault.com/questions/180853/how-to-copy-file-preserving-directory-path-in-linux#180870>.

    cp --parents foo/123/bar/abc.xml foo/321/baz/xyz.html .

## Other

    cp -a ~/var/www/ ~/tmp/

# Get release version

Release version compliant to Linux Standard Base (LSB)

    lsb_release --all

# ls

<http://en.wikipedia.org/wiki/Ls>

## Newest first

    ls -ltc --all

## Recurse into subdirectories

    ls --recursive

# nohup

<http://en.wikipedia.org/wiki/Nohup>

Start a process in the background and have it keep running after you log off

    nohup ./scripts/bootstrap.sh &

# watch

<http://en.wikipedia.org/wiki/Watch_(Unix)>

    watch --differences 'ps -aux | grep chrom'

# Other

    mkdir ~/root/{var/{db/pkg,paludis/distfiles,cache/paludis/{names_cache,write_cache},tmp/paludis}
    uname -a
    hostname -f
    id
    whereis vsftpd
    alias
    echo -e "1\n2"
    echo -n "Some text line"; echo -en "all the same text line.\n"
    cal -3
    time tar -cvvzf foobar.tar.gz ./lib/ ./mobotix/ /usr/share/doc/
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
    expand # Converts tabs to spaces.
    unexpand # Converts spaces to tabs.
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
    setterm -blength 0
    tput colors
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
    cdrecord dev=/dev/hdc <downloaded iso file>
    PAGER=cat man man
    vlc -I ncurses
    vobcopy
    evolution --force-shutdown
    sloccount .
    xmodmap ~/.Xmodmap
    xmodmap -pke > .xmodmap.orig
    tput cols && tput lines
    chsh -s /bin/zsh
    echo $?
