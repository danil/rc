# Wget rc

    wget ftp://anonymous@your.tld/path/to/file.tar
    wget --continue -t inf --waitretry=30 -b --retry-connrefused \
         [-O output_file ] "ftp://your.tld/path/to/file.tar"
    wget --page-requisites \
         --convert-links \
         --reject "robots.txt" \
         http://your.tld/path/to/file.tar

## Resume download

    wget --continue http://your.tld/path/to/file.tar

## Recursive

    wget --recursive \
         --level=999 \
         --domains=your.tld,www.your.tld \
         --restrict-file-names=nocontrol \
         --execute='robots=off' \
         --convert-links \
         --exclude-directories=/forum \
         --ignore-tags=img \
         --load-cookies=cookies.txt \
         'http://your.tld'
