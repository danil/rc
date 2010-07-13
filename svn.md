<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

Subversion
==========

    svnadmin create --fs-type fsfs /var/lib/svn/gamecard
    svn list svn+ssh://var/lib/svn/hello_rails/trunk/
    svn import -m "Initial import." --no-ignore ~/src/hello_world \
               svn+ssh://kutkevich.org/var/lib/svn/repos/hello/trunk
    svn checkout svn+ssh://kutkevich.org/var/lib/svn/repos/hello/trunk \
                 hello_rails
    svn checkout \
        svn+ssh://hc-ska.ru/home/ska/var/lib/svn/ska/trunk@202 test1
    svn mkdir -m "Making a new dir." \
              file:///home/danil/var/lib/svn/kutkevich/trunk
    svn add foo.c bar.c
    svn add -N foobar
    svn propset svn:keywords "Date Revision Author HeadURL" foo.c
    svn commit -m "Initial commit." ./
    svn copy trunk/ tags/0.0.1
    svn move -m "move dir." \
             file:///var/lib/svn/kutkevich/danil@kutkevich/danil \
             file:///var/lib/svn/kutkevich/danil@kutkevich/trunk/home/
    svn delete -m "Delete dir." \
               file:///var/lib/svn/kutkevich/danil@kutkevich/trunk/home
    svn log -r 199:230 --verbose \
            svn+ssh://kutkevich.org/var/lib/svn/repos/hello/trunk/dir
    svn log --verbose svn+ssh://kutkevich.org/var/lib/svn/repos/hello/trunk/foo@34
    svn log --verbose --stop-on-copy \
        svn+ssh://danil@beta.hc-ska.ru/home/ska/var/lib/svn/ska/skaonrails/branches/0.0.2/
    svn log -v| sed -n '/danil/,/-----$/ p'
    svn -r 228:256 merge \
        svn+ssh://danil@beta.hc-ska.ru/home/ska/var/lib/svn/ska/skaonrails/branches/0.0.2/
    svn propset svn:externals \
      "rails http://dev.rubyonrails.org/svn/rails/trunk" vendor
    svn up vendor
    svn propget svn:externals vendor

Get a list of all Subversion commit author usernames
----------------------------------------------------

<http://stackoverflow.com/questions/2494984>

    svn log --quiet | awk '/^r/ {print $3}' | sort -u
