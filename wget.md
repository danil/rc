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

Wget
====

    wget ftp://anonymous@kutkevich.org/pub/ruby-1.8.7-p72.tar.gz
    wget -c -t inf --waitretry=30 -b --retry-connrefused \
         [-O output_file ] "ftp://192.168.1.1/file"
    wget --page-requisites \
         --convert-links \
         --reject "robots.txt" \
         http://localhost:3000/maillists-invitations-contractor.html

Recursive
---------

    wget --recursive \
         --level=999 \
         --domains=sazhi.net,www.sazhi.net \
         --restrict-file-names=nocontrol \
         --execute'robots=off' \
         --convert-links \
         --exclude-directories=/forum \
         --ignore-tags=img \
         --load-cookies=cookies.txt \
         'http://sazhi.net'


cURL
====

    curl -o ruby.png http://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/100px-Ruby_logo.svg.png
    curl -v -H "Accept: application/xrds+xml" -X HEAD http://www.yahoo.com/

Gzipped
-------

    curl "http://example.org" | gunzip

<http://stackoverflow.com/questions/8364640/how-to-properly-handle-a-gzipped-page-when-using-curl#8365089>

    curl --compressed "http://example.org"
