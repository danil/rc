<!-- -*- coding: utf-8; -*- -->

cURL
====

    curl -o ruby.png http://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/100px-Ruby_logo.svg.png
    curl -v -H "Accept: application/xrds+xml" -X HEAD http://www.yahoo.com/

Gzipped
-------

    curl "http://example.org" | gunzip

<http://stackoverflow.com/questions/8364640/how-to-properly-handle-a-gzipped-page-when-using-curl#8365089>

    curl --compressed "http://example.org"
