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

Run image as container

    docker.io run  --detach --tty
                   --volume /var/teamcity-data:/opt/teamcity-data \
                   --volume /etc/localtime:/etc/localtime:ro \
                   --name teamcity_server \
                   --publish=5433:5432 \
                   mlapshin/docker-teamcity

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
