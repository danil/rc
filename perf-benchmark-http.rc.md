# HTTP benchmarks rc

## [ab][]

`ab` is an legacy benchmark utility

    ab -kc 10 -t 30 https://localhost

[ab]: https://httpd.apache.org/docs/trunk/programs/ab.html

## [httperf][]

    httperf --num-conns=10 --rate=120 \
            --server=your.tld --port=443 --ssl --uri /index.html
    httperf --num-conns=10 --rate=120 \
            --server=your.tld --port 80 --wsesslog=10,1,wsesslog_your

[httperf]: https://github.com/httperf/httperf

## [Siege][]

    siege --verbose --benchmark --concurrent=100 --reps=10 \
          --log=$HOME/siege.log --file=$HOME/siege-urls \
          --header="Cookie: ring-session=00000000-0000-0000-0000-000000000000"

[siege]: https://github.com/joedog/siege

## [wrk][]

    wrk --threads=12 --connections=400 --duration=30s https://localhost

[wrk]: https://github.com/wg/wrk

Runs a benchmark for 30 seconds, using 12 threads, and keeping
400 HTTP connections open.

## [hey][]

Runs 1000 requests, using 100 threads.

    hey -n 1000 -c 100 https://localhost

[hey]: https://github.com/rakyll/hey

## [bombardier][]

    bombardier https://localhost

[bombardier]: https://github.com/codesenberg/bombardier

Only one url (no multiple urls)

## [Herd][]

[herd]: https://github.com/imjacobclark/herd

## [Pandora][]

Produce HTTP/S/1/2 load.

[pandora]: http://github.com/yandex/pandora

## [k6][]

Written in Go programming language and scripting JavaScript.

[k6]: https://github.com/grafana/k6
