# cURL

## Only headers

<http://stackoverflow.com/questions/3252851/how-to-display-request-headers-with-command-line-curl>

    curl --head http://wikipedia.org

## Gzipped

    curl "http://example.org" | gunzip

<http://stackoverflow.com/questions/8364640/how-to-properly-handle-a-gzipped-page-when-using-curl#8365089>

    curl --compressed "http://example.org"

## Follow redirect

    curl --location http://example.org

## Other

    curl --output ruby.png http://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/100px-Ruby_logo.svg.png
    curl --verbose --header "Accept-Encoding: gzip" -X HEAD http://example.org
