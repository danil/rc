<!-- -*- coding: utf-8; -*- -->

# Docker

# Images

## List

    docker images

## Build

    docker build --tag mlapshin/docker-teamcity ./

## Tag

### Add

    docker tag 7f7a5e4d89e4 fhirbase/fhirbase

## Remove

    docker rmi foobar

### Remove all

    docker rmi $(docker images --quiet)

## Create

Create and start (or run) image as container

    docker create --env=HOME=/home/my_user \
                  --user="my_user"
                  --interactive \
                  --tty \
                  --volume /var/foobar-data:/opt/foobar-data \
                  --volume /etc/localtime:/etc/localtime:ro \
                  --name foobar_server \
                  --publish=8080:80 \
                  --publish=5433:5432 \
                  user-name/docker-foobar \
                  '/bin/bash' -l -c 'export LANG="C.UTF-8" \
                                     && sudo service postgresql start'
    docker start foobar_server

Get response from published port (get internal port 5432 as 5433 port
from outside)

    busybox telnet localhost 5433

## Run

    docker run --detach
               --name=foobar_server \
               --publish=80:80 \
               user-name/docker-foobar

## Inspect

    docker inspect foobar_server

## Commit

Save container as image after interactive changes

    docker commit user-name/docker-foobar docker-foobar:1970_01_01

# Registry

Push image to local registry repository  
<http://blog.docker.com/2013/07/how-to-use-your-own-registry/>

    docker tag my-image-id localhost:63711/medapp-demo
    docker push localhost:63711/medapp-demo

# Containers

## List

List all containers

    docker ps --all --no-trunc

### Json via socket

* <https://docs.docker.com/reference/api/docker_remote_api_v1.17/#list-containers>
* <http://superuser.com/questions/834307/can-curl-send-requests-to-sockets#834320>

    echo -e "GET /containers/json?all=1 HTTP/1.1\r\n" \
      | socat unix-connect:/var/run/docker.sock STDIO

## Start

Start container and attach STDOUT and STDERR

    docker start --attach teamcity_agent1

## Stop

    docker stop teamcity_serve

## Remove

    docker rm --force teamcity_agent1

### Remove all stopped/running

    docker rm $(docker ps --all --quiet)

## Stats

    docker stats foobar_server

## Backup

### Save

<http://stackoverflow.com/questions/21486004/how-do-i-move-a-docker-containers-image-to-a-persistent-disk#21632989>

    docker save image_name > image_name.tar

### Restore

    docker load < image_name.tar

# Linking

<https://docs.docker.com/userguide/dockerlinks/#communication-across-links>

Create container with `--link` option like this

    docker create --name your_container_name \
                  --link your_linked_container_name:your_alias_name \
                  your_image_name

Then environment variable `$YOUR_ALIAS_NAME_PORT_666_TCP_ADDR`
will contain linked container `IP` addres.
