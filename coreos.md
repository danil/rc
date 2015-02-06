<!-- -*- coding: utf-8; -*- -->

CoreOS
======

    coreos-cloudinit --from-file=./cloud-config.yaml
    fleetctl --endpoint=http://111.222.0.1:4001 list-machines
    fleetctl list-units
    fleetctl list-unit-files
    curl http://111.222.0.1:4001/v1/keys/_coreos.com/fleet/states
    etcdctl ls /_coreos.com/fleet/machines
    etcdctl get /coreos.com/network/config
    journalctl --unit=etcd

Get discovery URL form running system
-------------------------------------

<https://www.digitalocean.com/community/tutorials/how-to-set-up-a-coreos-cluster-on-digitalocean#adding-new-machines>

    grep DISCOVERY /run/systemd/system/etcd.service.d/20-cloudinit.conf
