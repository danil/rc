<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010, 2011, 2012, 2013,
     2014 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

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
