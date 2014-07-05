<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2014 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

Search and replace
==================

grep
----

    grep -R eth0 /etc
    grep -irl danil . 2> /dev/null | xargs tar cvvf ~/tmp/123.tar

### Only names

    grep --files-with-matches --no-messages

### Select non-matching lines

    grep --invert-match foo.*bar

pcregrep
--------

* Multiple lines matching
  <http://stackoverflow.com/questions/2686147/how-to-find-patterns-across-multiple-lines-using-grep#answer-2686705>
  <http://stackoverflow.com/questions/3863792/an-ack-or-grep-regex-to-match-two-lines-that-are-nearly-the-same#answer-3864440>
* Perl-compatible regex

    pcregrep -rM 'class.*(\n|.)*class' lib/cda/

find
----

    find ~/ -mount -type f -size -100k -iname "*.rb" \
            -exec grep -q -e danil\\.kutkevich \{\} \;
    find "/etc/" -mount -maxdepth 3 -type f -size -100k -name "*.conf" \
     |xargs grep -ilE "192\.168\.1\.[0-9]+"
    find ./ -type d -exec chmod 755 '{}' \;
    find ./ -type f |while read I; do \
        NEWNAME1=$( md5sum "$I" |cut -d " " -f 1 ); \
        NEWNAME2=$(dirname "$I")/$NEWNAME1_$( basename "$I"); \
        mv "$I" "$NEWNAME2"; done;

### Search and remove file with inode number

<http://unix.com/solaris/23278-file-no-name.html>
<http://www.cyberciti.biz/tips/delete-remove-files-with-inode-number.html>

    ls -il /var/ftp/incoming
    find /var/ftp/incoming -inum [inode-number] -exec rm {} \;

### Recreate symlinks

    find / -type l -exec sh -c 'lname="{}"; ltarget=$(readlink "${lname}"); rm "${lname}"; ln -s "${ltarget}" "${lname}"' \;

Remove empty dirs
-----------------

    find -depth -type d -empty -exec rmdir {} \;

    find ./ -mount -type f -iname "*~" -exec rm {} \;
    find /lib/modules/2.6.30/ -type f -iname '*.o' -or -iname '*.ko'

sed
---

Stream Editor

    find ./ -type f -iregex ".*e?rb" -exec sed -i -r \
         -e 's|http://tinyerp\.(org\|com)(/edoc)?/?|./|g' '{}' \;
    echo 'Hello, World!' |sed -e s/World/work/
    svn status |grep '^[I?]' |sed 's/^[I?]//' |xargs rm -rf

### Remove the 7rd line

    sed -i '7d' ~/.ssh/known_hosts

### Cut from starting to ending line-numbers

<http://stackoverflow.com/questions/5683367/how-to-cropcut-text-files-based-on-starting-and-ending-line-numbers-in-cygwin#5683408>

    sed -n '134650000,134900000p' production.log > production-2013-02-18.log

### Add \n at end of file

Adds `\n` at the end of the file only if it doesn’t already end with a newline
<http://unix.stackexchange.com/questions/31947/how-to-add-a-newline-to-the-end-of-a-file#31955>,
<http://unix.stackexchange.com/questions/31947/how-to-add-a-newline-to-the-end-of-a-file#comment-43399>.

sed --in-place --expression='$a\' ~/.dmenu_history

AWK
---

    awk '{ FS = "\t" ; OFS = "\t" ; print $1,"ru",$2,$3 }' \
        infile > outfile
    awk '{ FS = "\t" ; OFS = "\t" ; if ( NR > 1 ) print $1,$3 }' \
        infile > outfile

tr
--

### Convert uppercase to lowercase

<http://cyberciti.biz/faq/linux-unix-shell-programming-converting-lowercase-uppercase>

    tr '[:upper:]' '[:lower:]' < input.txt > output.txt

### Replacing returns with space

    cat ./file | tr '\n' ' '

### Config dryup

    cat /etc/ntp.conf | grep -v '^#' | grep -v '^$'

ag
--

The silver searcher <https://github.com/ggreer/the_silver_searcher>.

    ag Webpage ~/src/jobtest-aviasales-ru/

### Search for file name

    ag --all-types -g [a-z]+array

### Only print filenames containing matches

    ag --files-with-matches "{{" config/

ack
---

    ack Webpage ~/src/jobtest-aviasales-ru/

### Search for file name

    ack --all-types -g [a-z]+array

### Only print filenames containing matches

    ack --files-with-matches "{{" config/
