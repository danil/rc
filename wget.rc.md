# Wget

    wget ftp://anonymous@domain.tld/path/to/file.tar
    wget --continue -t inf --waitretry=30 -b --retry-connrefused \
         [-O output_file ] "ftp://domain.tld/path/to/file.tar"
    wget --page-requisites \
         --convert-links \
         --reject "robots.txt" \
         http://domain.tld/path/to/file.tar

## Resume download

    wget --continue http://domain.tld/path/to/file.tar

## Recursive

    wget --recursive \
         --level=999 \
         --domains=example.org,www.example.org \
         --restrict-file-names=nocontrol \
         --execute='robots=off' \
         --convert-links \
         --exclude-directories=/forum \
         --ignore-tags=img \
         --load-cookies=cookies.txt \
         'http://example.org'
