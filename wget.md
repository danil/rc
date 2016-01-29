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
