# Foobar

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

# logrotate

Test configs

    logrotate --debug --force /etc/logrotate.conf

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
