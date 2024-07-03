# System benchmark <sup><sub>[1247177298][]</sub></sub> rc

[1247177298]: http://jeffgeerling.com/blogs/jeff-geerling/2013-vps-benchmarks-linode

## HOWTO CPU

    sysbench --test=cpu --cpu-max-prime=20000 run

## HOWTO CPU Multithreaded

    sysbench --test=cpu --num-threads=4 run

## HOWTO Memory

    sysbench --test=memory --memory-total-size=1G run

## HOWTO Disk `dd` <sup><sub>[297458425][]</sub></sup>

    dd if=/dev/zero of=/tmp/foobar bs=1M count=1024 conv=fdatasync
    iotop

[297458425]: https://haydenjames.io/web-host-doesnt-want-read-benchmark-vps

## Disk TODO

* app-benchmarks/bonnie++
* app-benchmarks/dbench
* app-benchmarks/tiobench
* sys-block/fio
