# cURL rc

## View sent/received headers

    curl --verbose --head http://wikipedia.org

## Without progress bar

    curl --silent https://api.github.com/repos/tomnomnom/gron/commits?per_page=1

## Only headers

<http://stackoverflow.com/questions/3252851/how-to-display-request-headers-with-command-line-curl>

    curl --head http://wikipedia.org

## POST

* <http://superuser.com/questions/149329/what-is-the-curl-command-line-syntax-to-do-a-post-request>
* <https://gist.github.com/subfuzion/08c5d85437d5d4f00e58#post>

### Key-values

    curl --request POST \
         --header "Content-Type: application/x-www-form-urlencoded" \
         --data "foo=123&bar=xyz" \
         "http://your.tld"

### JSON

    curl --request POST \
         --header "Content-Type: application/json" \
         --data '{"foo":123,"bar":"xyz"}' \
         "http://your.tld"

## Gzipped

    curl --header "Accept-encoding: gzip" "http://your.tld" | gunzip

<http://stackoverflow.com/questions/8364640/how-to-properly-handle-a-gzipped-page-when-using-curl#8365089>

    curl --compressed "http://your.tld"

## Follow redirect

    curl --location http://your.tld

## Download output to file

    curl --output file.tar.gz https://your.tld/path/to/file.tar.gz
    curl -o file.tar.gz https://your.tld/path/to/file.tar.gz

## Accept header

Accept JSON response

    curl --verbose --header "Accept: application/json" http://your.tld

## Other

    curl --verbose --request HEAD http://your.tld
