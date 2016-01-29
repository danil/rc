CVS
===

    cvs -d /home/cvs/cvsroot/ init
    cvs -d :ext:danil@192.168.91.2:/home/cvs/cvsroot/ import \
        -m "Initial Import" project myname release
    CVSROOT=:ext:barm@ssh.barm.nichost.ru:/home/barm/cvsroot \
     cvs checkout -d to_dir project/dir
    cvs add dir/file
    cvs add -kb image.jpg
    cvs remove -f dir/file
    cvs commit -m "Comments here."
    cvs status hello.c
    cvs diff -r 1.1 -r 1.2 hello.c
    cvs annotate hello.c
    cvs update -dP
    cvs log -S -d"2008-07-22 23:00<2008-07-24 20:00" \
            -wdanil hello.c > cvs_log

Recursively delete CVS directories
----------------------------------

    find ./ -depth -name 'CVS' -exec rm -rf '{}' \;
