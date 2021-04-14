# HTTP benchmarks

## ab

`ab` is an legacy benchmark utility

    ab -kc 10 -t 30 https://localhost

## httperf

    httperf --num-conns=10 --rate=120 \
            --server=your.tld --port=443 --ssl --uri /index.html
    httperf --num-conns=10 --rate=120 \
            --server=your.tld --port 80 --wsesslog=10,1,wsesslog_your

## siege

    siege --verbose --benchmark --concurrent=100 --reps=10 \
          --log=$HOME/siege.log --file=$HOME/siege-urls \
          --header="Cookie: ring-session=00000000-0000-0000-0000-000000000000"

## wrk

<https://github.com/wg/wrk>

Runs a benchmark for 30 seconds, using 12 threads, and keeping
400 HTTP connections open.

    wrk --threads=12 --connections=400 --duration=30s https://localhost

## boom

<https://github.com/rakyll/boom>

Runs 1000 requests, using 100 threads

    boom -n 1000 -c 100 https://localhost

## bombardier

Only one url (no multiple urls)
<https://github.com/codesenberg/bombardier>

    bombardier https://localhost

## Herd

<https://github.com/imjacobclark/Herd>

## Pandora

HTTP/S/1/2 load generator http://github.com/yandex/pandora
