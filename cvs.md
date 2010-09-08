<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

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
