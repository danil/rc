# cURL rc

## HOWTO View sent/received headers

    curl -v --verbose -I --head --url http://wikipedia.org

## HOWTO Without progress bar

    curl -s --silent --url https://api.github.com/repos/tomnomnom/gron/commits?per_page=1

## HOWTO Only headers

<http://stackoverflow.com/questions/3252851/how-to-display-request-headers-with-command-line-curl>

    curl -I --head --url http://wikipedia.org

## HOWTO POST

* <http://superuser.com/questions/149329/what-is-the-curl-command-line-syntax-to-do-a-post-request>
* <https://gist.github.com/subfuzion/08c5d85437d5d4f00e58#post>

## HOWTO POST Key-values

    curl --request POST \
         --header "Content-Type: application/x-www-form-urlencoded" \
         --data "foo=123&bar=xyz" \
         --url http://your.tld

## HOWTO POST JSON

    curl -X POST --request POST \
         -H "Content-Type: application/json" --header "Content-Type: application/json" \
         -d '{"foo":123,"bar":"xyz"}' --data '{"foo":123,"bar":"xyz"}' \
         --url http://your.tld

## HOWTO Gzipped

    curl --header "Accept-encoding: gzip" --url http://your.tld | gunzip

<http://stackoverflow.com/questions/8364640/how-to-properly-handle-a-gzipped-page-when-using-curl#8365089>

    curl --compressed --url http://your.tld

## HOWTO Follow redirect

    curl -L --location --url http://your.tld

## HOWTO Download output to file

    curl -o file.tar.gz --output file.tar.gz
         --url https://your.tld/path/to/file.tar.gz

## HOWTO Accept header <sup>accept JSON response</sup>

    curl -v --verbose \
         -H "Accept: application/json" --header "Accept: application/json" \
         --url http://your.tld

## HOWTO Other

    curl -v --verbose -X HEAD --request HEAD --url http://your.tld
