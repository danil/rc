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

Start
-----

    docker.io start teamcity_agent1

Stop
----

    docker.io stop teamcity_serve

Remove
------

    docker.io rm -f teamcity_agent1

### Remove all stoped

    docker.io rm $(docker.io ps -aq)

Build
-----

    docker.io build -t mlapshin/docker-teamcity .

Run
---

    docker.io run  -dt
                   -v /var/teamcity-data:/opt/teamcity-data \
                   -v /etc/localtime:/etc/localtime:ro \
                   --name teamcity_server \
                   -p 8111:8111 \
                   mlapshin/docker-teamcity
