# [find][] rc

[find]: https://en.wikipedia.org/wiki/Find_(Unix)

* HOWTO Latest modified in last minute   `find your/path -mmin 1`       <sup><sub>Find recently changed files within 1 minutes. Recently changed. [4038478314][]</sub></sup>
* HOWTO Latest modified in last 24 hours `find your/path -mtime -1 -ls` <sup><sub>[4038478314][]</sub></sup>
* HOWTO Match regexp with logical operator *`OR`* `find -regex ".*\(your-dir1\|your-dir2\).*your.file"`         <sup><sub>[773388999][]</sub></sup>
* HOWTO Latest modified/newest files  `find . -type f -printf '%T@ %p\n' | sort -n | tail -42 | cut -f2- -d" "` <sup><sub>Latest modified/newest files (42 items). [602259898][].</sub></sup>
* HOWTO Search and remove file with inode number `ls -il /var/ftp/incoming` and then `find /var/ftp/incoming -inum [inode-number] -exec rm {} \;` <sup><sub>[2449165184][] [1301733587][]</sub></sup>
* HOWTO Recreate symlinks             `find / -type l -exec sh -c 'lname="{}"; ltarget=$(readlink "${lname}"); rm "${lname}"; ln -s "${ltarget}" "${lname}"' \;`
* HOWTO Count named directories       `find -type d -name "your_nm" | wc -l`
* HOWTO Empty directories             `find -type d -empty`
* HOWTO Remove empty directories      `find -type d -empty -delete` or `find -type d -empty -depth -exec rmdir {} \;`
* HOWTO Remove empty/zero size files  `find -type f -empty -delete` or `find -type f -size 0 -delete`
* HOWTO Remove temporary files        `find -mount -type f -iname "*~" -exec rm {} \;`
* HOWTO Remove compilation files      `find -type f -iname '*.o' -or -iname '*.ko'`
* HOWTO Exclude dirs VER2             `find where/to/find -name *your_pattern* -not -path '*/first_dir*' -not -path '*/second_dir*'` <sup><sub>Find but not in some directories. Except directories.</sub></sup>
* HOWTO Exclude dirs VER1             `find where/to/find -name *your_pattern* ! -path '*/first_dir*' ! -path '*/second_dir*'`       <sup><sub>Except.</sub></sup>
* HOWTO Exclude `git` dir VER2        `find -not -path '*/.git*'`       <sup><sub>Except `git` directory.</sub></sup>
* HOWTO Exclude `git` dir VER1        `find -not -iwholename '*/.git*'` <sup><sub>Except.</sub></sup>
* HOWTO Sort by date                  `find where/to/find -name *your_pattern* -printf "%T+\t%p\n" | sort` <sup><sub>Find and sort results by mtime. [981028587][]</sub></sup>

[1301733587]: http://www.cyberciti.biz/tips/delete-remove-files-with-inode-number.html
[2449165184]: http://unix.com/solaris/23278-file-no-name.html
[4038478314]: http://stackoverflow.com/questions/16085958/scripts-find-the-files-have-been-changed-in-last-24-hours#16086041
[602259898]: https://stackoverflow.com/questions/4561895/how-to-recursively-find-the-latest-modified-file-in-a-directory#4561987
[773388999]: https://superuser.com/questions/1026412/use-of-the-or-regex-operator-with-the-find-command#1026420
[981028587]: http://unix.stackexchange.com/questions/29899/how-can-i-use-find-and-sort-the-results-by-mtime#29901

## Other

    find ~/ -mount -type f -size -100k -iname "*.rb" -exec grep -q -e danil\\.kutkevich \{\} \;
    find "/etc/" -mount -maxdepth 3 -type f -size -100k -name "*.conf" | xargs grep -ilE "192\.168\.1\.[0-9]+"
    find ./ -type d -exec chmod 755 '{}' \;
    find ./ -type f | while read I; do NEWNAME1=$( md5sum "$I" | cut -d " " -f 1 ); NEWNAME2=$(dirname "$I")/$NEWNAME1_$( basename "$I"); mv "$I" "$NEWNAME2"; done;
