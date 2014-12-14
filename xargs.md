<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010, 2011, 2012, 2013,
     2014 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

xargs
=====

Files content
-------------

### By last modify

<http://superuser.com/questions/294161/unix-linux-find-and-sort-by-date-modified#546900>

    find . -name *.ebuild -printf "%T@ %Tc %p\n" \
      | sort -n \
      | sed -e 's|^[^\/]* ||' \
      | xargs -I % sh -c 'echo -e "\n\n########### %\n" && cat %' \
      | less

### Other

    ack -a -g . | xargs -I % sh -c 'echo -e "\n\n########### %\n" && cat %' | less
