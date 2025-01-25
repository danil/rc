# HTTP benchmark rc

## HOWTO [ab][] <sup><sub>`ab` is an legacy benchmark util</sup></sub>

    ab -kc 10 -t 30 https://localhost

[ab]: https://httpd.apache.org/docs/trunk/programs/ab.html

## HOWTO [httperf][]

    httperf --num-conns=10 --rate=120 \
            --server=your.tld --port=443 --ssl --uri /index.html
    httperf --num-conns=10 --rate=120 \
            --server=your.tld --port 80 --wsesslog=10,1,wsesslog_your

[httperf]: https://github.com/httperf/httperf

## HOWTO [Siege][]

    siege --verbose --benchmark --concurrent=100 --reps=10 \
          --log=$HOME/siege.log --file=$HOME/siege-urls \
          --header="Cookie: ring-session=00000000-0000-0000-0000-000000000000"

[siege]: https://github.com/joedog/siege

## HOWTO [wrk][] <sup><sub>runs a benchmark for 30 seconds, using 12 threads, and keeping 400 HTTP connections open</sup></sub>

    wrk --threads=12 --connections=400 --duration=30s https://localhost

[wrk]: https://github.com/wg/wrk

## HOWTO [hey][] <sup><sub>runs 1000 requests, using 100 threads</sup></sub>

    hey -n 1000 -c 100 https://localhost

[hey]: https://github.com/rakyll/hey

## HOWTO [bombardier][] <sup><sub>only one url (no multiple urls)</sup></sub>

    bombardier https://localhost

[bombardier]: https://github.com/codesenberg/bombardier

## HOWTO [Herd][]

[herd]: https://github.com/imjacobclark/herd

## HOWTO [Pandora][] <sup><sub>produce HTTP/S/1/2 load</sup></sub>

[pandora]: http://github.com/yandex/pandora

## TODO

* [k6][] PROS: [Go][]. CONS: [JavaScript][JS].

[js]: https://en.wikipedia.org/wiki/JavaScript "JavaScript"
[go]: https://github.com/golang/go
[k6]: https://github.com/grafana/k6
