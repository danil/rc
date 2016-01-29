# CoreOS

    coreos-cloudinit --from-file=./cloud-config.yaml
    curl http://111.222.0.1:4001/v1/keys/_coreos.com/fleet/states
    etcdctl ls /_coreos.com/fleet/machines
    etcdctl get /coreos.com/network/config
    journalctl --unit=etcd

# fleetctl

<https://www.digitalocean.com/community/tutorials/how-to-use-fleet-and-fleetctl-to-manage-your-coreos-cluster#basic-machine-management-commands>

    fleetctl --endpoint=http://111.222.0.1:4001 list-machines
    fleetctl submit foo.service
    fleetctl list-unit-files
    fleetctl load foo.service
    fleetctl start foo.service
    fleetctl list-units
    fleetctl stop foo.service
    fleetctl unload foo.service
    fleetctl status foo.service
    fleetctl cat foo.service
    fleetctl journal --lines 20 foo.service
    fleetctl destroy foo.service

# IPs

Get public and private IPs form running system
<https://www.digitalocean.com/community/tutorials/how-to-use-fleet-and-fleetctl-to-manage-your-coreos-cluster#basic-machine-management-commands>

    cat /etc/environment

# Discovery URL

Get discovery URL form running system
<https://www.digitalocean.com/community/tutorials/how-to-set-up-a-coreos-cluster-on-digitalocean#adding-new-machines>

    grep DISCOVERY /run/systemd/system/etcd.service.d/20-cloudinit.conf
