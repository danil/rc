# cURL

## Without progress bar

    curl --silent https://api.github.com/repos/tomnomnom/gron/commits?per_page=1

## Only headers

<http://stackoverflow.com/questions/3252851/how-to-display-request-headers-with-command-line-curl>

    curl --head http://wikipedia.org

## POST

<http://superuser.com/questions/149329/what-is-the-curl-command-line-syntax-to-do-a-post-request>

    curl --request POST --data "foo=123&bar=xyz" "http://example.org"

## Gzipped

    curl "http://example.org" | gunzip

<http://stackoverflow.com/questions/8364640/how-to-properly-handle-a-gzipped-page-when-using-curl#8365089>

    curl --compressed "http://example.org"

## Follow redirect

    curl --location http://example.org

## Output to file

    curl --output=top-1m.csv.zip
         http://s3.amazonaws.com/alexa-static/top-1m.csv.zip

## Other

    curl --verbose --header "Accept-Encoding: gzip" -X HEAD http://example.org
