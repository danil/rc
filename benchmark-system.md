# System benchmark

<http://jeffgeerling.com/blogs/jeff-geerling/2013-vps-benchmarks-linode>

## CPU

    sysbench --test=cpu --cpu-max-prime=20000 run

### Multithreaded

    sysbench --test=cpu --num-threads=4 run

## Memory

    sysbench --test=memory --memory-total-size=1G run

## Disk

### dd

<https://haydenjames.io/web-host-doesnt-want-read-benchmark-vps>

    dd if=/dev/zero of=/tmp/foobar bs=1M count=1024 conv=fdatasync

### Other

* app-benchmarks/bonnie++
* app-benchmarks/dbench
* app-benchmarks/tiobench
* sys-block/fio
