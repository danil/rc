# find rc

## Latest modified in last minute

Latest/recently modified/changed

Find recently changed files within 1 minutes
<http://stackoverflow.com/questions/16085958/scripts-find-the-files-have-been-changed-in-last-24-hours#16086041>

    find your/path -mmin 1

## Latest modified in last 24 hours

<http://stackoverflow.com/questions/16085958/scripts-find-the-files-have-been-changed-in-last-24-hours#16086041>

    find your/path -mtime -1 -ls

## Latest modified/newest files

Latest modified/newest files (42 items)

<https://stackoverflow.com/questions/4561895/how-to-recursively-find-the-latest-modified-file-in-a-directory#4561987>

    find . -type f -printf '%T@ %p\n' | sort -n | tail -42 | cut -f2- -d" "

## Search and remove file with inode number

<http://unix.com/solaris/23278-file-no-name.html>
<http://www.cyberciti.biz/tips/delete-remove-files-with-inode-number.html>

    ls -il /var/ftp/incoming
    find /var/ftp/incoming -inum [inode-number] -exec rm {} \;

## Recreate symlinks

    find / -type l -exec sh -c 'lname="{}"; ltarget=$(readlink "${lname}"); rm "${lname}"; ln -s "${ltarget}" "${lname}"' \;

## Remove empty dirs

    find -depth -type d -empty -exec rmdir {} \;

    find ./ -mount -type f -iname "*~" -exec rm {} \;
    find /lib/modules/2.6.30/ -type f -iname '*.o' -or -iname '*.ko'

## Remove empty files

Remove files with zero sizes

    find path/to/dir -type f -size 0 -delete

## Remove empy directories

    find path/to/dir -type d -empty -delete

## Exclude dirs

Find but not in some directories

    find where/to/find -name *your_pattern* \
         -not -path '*/first_dir*' -not -path '*/second_dir*'
    find where/to/find -name *your_pattern* \
         ! -path '*/first_dir*' ! -path '*/second_dir*'

## Sort by date

Find and sort results by mtime
<http://unix.stackexchange.com/questions/29899/how-can-i-use-find-and-sort-the-results-by-mtime#29901>

    find where/to/find -name *your_pattern* -printf "%T+\t%p\n" | sort

## Other

    find ~/ -mount -type f -size -100k -iname "*.rb" \
            -exec grep -q -e danil\\.kutkevich \{\} \;

    find "/etc/" -mount -maxdepth 3 -type f -size -100k -name "*.conf" \
     | xargs grep -ilE "192\.168\.1\.[0-9]+"

    find ./ -type d -exec chmod 755 '{}' \;

    find ./ -type f | \
        while read I; do \
            NEWNAME1=$( md5sum "$I" | cut -d " " -f 1 ); \
            NEWNAME2=$(dirname "$I")/$NEWNAME1_$( basename "$I"); \
            mv "$I" "$NEWNAME2"; done;
