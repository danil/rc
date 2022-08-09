# Docker

## Images list

Size and so on.

    docker images

## Image build

    docker build --tag=your-ropo/your-image:your-tag \
                 --file=path/to/Dockerfile ./

## Image tag add

    docker tag 7f7a5e4d89e4 fhirbase/fhirbase

## Image tag remove

    docker rmi foobar

## Image tag remove all

    docker rmi $(docker images --quiet)

## Image create

Create and start (or run) image as container

    docker create --env=HOME=/home/your_usr \
                  --user="your_usr"
                  --interactive \
                  --tty \
                  --volume=/path/to/host/dir:/path/to/container/dir:ro \
                  --entrypoint="/bin/bash"
                  --name=your-container-nm \
                  --publish=your_external_port:your_internal_port \
                  --publish=your_external_port_2:your_internal_port_2 \
                  your/image-nm \
                  -l -c 'export LANG="C.UTF-8" \
                         && service postgresql start'
    docker start your-container-nm

Get response from published port (get internal port 5432 as 5433 port
from outside)

    busybox telnet localhost 5433

## Image crate privileged

Run docker inside docker

Run docker inside docker
<https://docs.docker.com/reference/commandline/cli/#create>

    docker create --privileged --name=your-container-nm your/image-nm

## Image run

    docker run --detach
               --name=your-container-nm \
               --publish=80:80 \
               your/image-nm

## Image inspect

    docker inspect foobar_server

## Image commit

Save container as image after interactive changes

    docker commit your_usr_nm/your_container_nm \
                  your_image_nm:1970_01_01

## Copy to container 

Copy from container to host

    docker cp <containerId>:/file/path/within/container /path/to/host/dir

Copy from host to container

    docker cp /path/to/host/dir <containerId>:/file/path/within/container

## Registry

Push image to local registry repository  
<http://blog.docker.com/2013/07/how-to-use-your-own-registry/>

    docker tag my-image-id localhost:63711/medapp-demo
    docker push localhost:63711/medapp-demo

## Containers list

List all containers

    docker ps --all --no-trunc

## Container list as json via socket

* <https://docs.docker.com/reference/api/docker_remote_api_v1.17/#list-containers>
* <http://superuser.com/questions/834307/can-curl-send-requests-to-sockets#834320>

    echo -e "GET /containers/json?all=1 HTTP/1.1\r\n" \
      | socat unix-connect:/var/run/docker.sock STDIO

## Container start

Start container and attach STDOUT and STDERR

    docker start --attach teamcity_agent1

## Container stop

    docker stop teamcity_serve

## Container remove

    docker rm --force teamcity_agent1

## Remove all  stopped/running containers

    docker rm $(docker ps --all --quiet)

## Rename container

    docker rename your-old-nm your-new-nm

## Container stats

    docker stats foobar_server

## Linking

<https://docs.docker.com/userguide/dockerlinks/#communication-across-links>

Create container with `--link` option like this

    docker create --name your_container_nm \
                  --link your_linked_container_nm:your_alias_nm \
                  your_image_nm

Then environment variable `$YOUR_ALIAS_NM_PORT_666_TCP_ADDR`
will contain linked container `IP` addres.

## Backup save

<http://stackoverflow.com/questions/21486004/how-do-i-move-a-docker-containers-image-to-a-persistent-disk#21632989>

    docker save image_name > image_name.tar
    docker export container_name > image_name.tar

## Backup restore

    docker load < image_name.tar

## Backup import

Import will flatten and reduce image size
<https://www.ctl.io/developers/blog/post/optimizing-docker-images>

    cat file.tar.gz | docker import - your-image-nm

## init scripts

Host system init scripts (upstart or systemd)

<https://docs.docker.com/engine/admin/host_integration/#/examples>

## Log

    docker logs -f your-container-nm_1

## Cleanup

Cleanup/remove stopped containers/dangling images/build cache

    docker system prune

## Login

    docker login --username=your-user http://your.tld
