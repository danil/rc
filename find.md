# find

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

## Recently changed

Find recently changed files within 1 minutes
<http://stackoverflow.com/questions/16085958/scripts-find-the-files-have-been-changed-in-last-24-hours#16086041>

    find your/path -mmin 1

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

## Exclude dirs

Find but not in some directories

    find where/to/find -name *your_pattern* \
         -not -path '*/first_dir*' -not -path '*/second_dir*'
