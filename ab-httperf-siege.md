# ab

    ab -kc 10 -t 30 http://kutkevich.org

# httperf

    httperf --num-conns 10 --rate 120 \
            --server kutkevich.org --port 80 --uri /index.html
    httperf --num-conns 10 --rate 120 \
            --server kutkevich.org --port 80 --wsesslog=10,1,wsesslog_ska

# siege

    siege --concurrent=1 --reps=1 --verbose \
          --log=$HOME/siege.log --file=$HOME/siege-urls \
          --header="Cookie: ring-session=00000000-0000-0000-0000-000000000000"

# wrk

<https://github.com/wg/wrk>

Runs a benchmark for 30 seconds, using 12 threads, and keeping
400 HTTP connections open.

    wrk -t12 -c400 -d30s http://localhost

# boom

<https://github.com/rakyll/boom>

Runs 1000 requests, using 100 threads

    boom -n 1000 -c 100 https://localhost

# Herd

<https://github.com/imjacobclark/Herd>
