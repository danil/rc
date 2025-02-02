# [cURL][] <sup><sub>[wcURL][] [trURL][]</sub></sup> rc

[curl]: https://github.com/curl/curl
[trurl]: https://github.com/curl/trurl
[wcurl]: https://github.com/curl/wcurl

* HOWTO Download file `curl -O --remote-name -C - --continue-at - -L --location --url http://your.tld/your.file` <sup><sub>[Wget][]</sub></sub>
* HOWTO View sent/received headers `curl -v --verbose -I --head --url http://wikipedia.org`
* HOWTO Without progress bar `curl -s --silent --url https://api.github.com/repos/tomnomnom/gron/commits?per_page=1`
* HOWTO Only headers `curl -I --head --url http://your.tld` <sup><sub>[3737298796][]</sub></sup>
* HOWTO FIXME *POST* <sup><sub>[*][443672816] [*][3153884880]</sub></sup>
* HOWTO Custom certificate `curl --request POST https://your.tld/your/path --cacert certs/ca.crt --cert certs/server.crt --key certs/server.key`
* HOWTO Ignore certificate `curl --insecure https://your.tld` <sup><sub>Disable certificate verification [2626545445][]</sub></sup>

[wget]: https://gnu.org/software/wget
[2626545445]: https://serverfault.com/questions/469824/curl-disable-certificate-verification
[3153884880]: https://gist.github.com/subfuzion/08c5d85437d5d4f00e58#post
[3737298796]: http://stackoverflow.com/questions/3252851/how-to-display-request-headers-with-command-line-curl
[443672816]: http://superuser.com/questions/149329/what-is-the-curl-command-line-syntax-to-do-a-post-request

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

## HOWTO Gzipped <sup><sub>[3168698307][]</sub></sup>

    curl --header "Accept-encoding: gzip" --url http://your.tld | gunzip
    curl --compressed --url http://your.tld

[3168698307]: http://stackoverflow.com/questions/8364640/how-to-properly-handle-a-gzipped-page-when-using-curl#8365089

## HOWTO Follow redirect

    curl -L --location --url http://your.tld

## HOWTO Download output to file

    curl -o file.tar.gz --output file.tar.gz
         --url https://your.tld/path/to/file.tar.gz

## HOWTO  Resume failed download <sup><sub>[1443426446][]</sub></sup>

    curl -O --remote-name -C - --continue-at - --url http://your.tld/your.file

[1443426446]: https://stackoverflow.com/questions/19728930/how-to-resume-interrupted-download-automatically-in-curl#47343997

## HOWTO Accept header <sup>accept JSON response</sup>

    curl -v --verbose \
         -H "Accept: application/json" --header "Accept: application/json" \
         --url http://your.tld

## HOWTO Other

    curl -v --verbose -X HEAD --request HEAD --url http://your.tld
