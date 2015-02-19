<!-- -*- coding: utf-8; -*- -->

Docker
======

Images
======

Build
-----

    docker.io build --tag mlapshin/docker-teamcity ./

Tag
---

### Add

    docker.io tag 7f7a5e4d89e4 fhirbase/fhirbase

Remove
------

    docker.io rmi foobar

### Remove all

    docker.io rmi $(docker.io images --quiet)

Run
---

Run image as container (get internal port 5432 as 5433 port from outside)

    docker.io run  --detach --tty
                   --volume /var/foobar-data:/opt/foobar-data \
                   --volume /etc/localtime:/etc/localtime:ro \
                   --name foobar_server \
                   --publish=5433:5432 \
                   user-name/docker-foobar

Get response from published port

    busybox telnet localhost 5433

Containers
==========

List
----

List all containers

    docker.io ps --all

Start
-----

    docker.io start teamcity_agent1

Stop
----

    docker.io stop teamcity_serve

Remove
------

    docker.io rm --force teamcity_agent1

### Remove all stoped

    docker.io rm $(docker.io ps --all --quiet)

Backup
------

### Save

<http://stackoverflow.com/questions/21486004/how-do-i-move-a-docker-containers-image-to-a-persistent-disk#21632989>

    docker save image_name > image_name.tar

### Restore

    docker load < image_name.tar
