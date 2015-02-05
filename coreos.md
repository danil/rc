<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2015 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->


CoreOS
======

    coreos-cloudinit --from-file=./cloud-config.yaml
    fleetctl --endpoint=http://111.222.0.1:4001 list-machines
    fleetctl list-units
    fleetctl list-unit-files
    curl http://111.222.0.1:4001/v1/keys/_coreos.com/fleet/states
    etcdctl ls /_coreos.com/fleet/machines
    etcdctl get /coreos.com/network/config
