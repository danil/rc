<!-- -*- coding: utf-8; -*- -->

# Docker

# Images

## List

    docker.io images

## Build

    docker.io build --tag mlapshin/docker-teamcity ./

## Tag

### Add

    docker.io tag 7f7a5e4d89e4 fhirbase/fhirbase

## Remove

    docker.io rmi foobar

### Remove all

    docker.io rmi $(docker.io images --quiet)

## Run

Run image as container (get internal port 5432 as 5433 port from outside)

    docker.io run -e HOME=/home/my_user \
                  --user="my_user"
                  --interactive \
                  --tty \
                  --detach \
                  --volume /var/foobar-data:/opt/foobar-data \
                  --volume /etc/localtime:/etc/localtime:ro \
                  --name foobar_server \
                  --publish=5433:5432 \
                  user-name/docker-foobar \
                  '/bin/bash' -l -c 'export LANG="C.UTF-8" \
                                     && sudo service postgresql start'

Get response from published port

    busybox telnet localhost 5433

## Commit

Save container as image after interactive changes

    docker.io commit user-name/docker-foobar docker-foobar:1970_01_01

# Registry

Push image to local registry repository  
<http://blog.docker.com/2013/07/how-to-use-your-own-registry/>

    docker.io tag my-image-id localhost:63711/medapp-demo
    docker.io push localhost:63711/medapp-demo

# Containers

## List

List all containers

    docker.io ps --all

## Start

    docker.io start teamcity_agent1

## Stop

    docker.io stop teamcity_serve

## Remove

    docker.io rm --force teamcity_agent1

### Remove all stoped

    docker.io rm $(docker.io ps --all --quiet)

## Backup

### Save

<http://stackoverflow.com/questions/21486004/how-do-i-move-a-docker-containers-image-to-a-persistent-disk#21632989>

    docker save image_name > image_name.tar

### Restore

    docker load < image_name.tar
