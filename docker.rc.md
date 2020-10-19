# Docker

## Images

### List

Size and so on.

```sh
docker images
```

### Build

```sh
docker build --tag=your-repository/your-image:your-tag \
             --file=path/to/Dockerfile ./
```

### Tag

#### Add

```sh
docker tag 7f7a5e4d89e4 fhirbase/fhirbase
```

### Remove

```sh
docker rmi foobar
```

#### Remove all

```sh
docker rmi $(docker images --quiet)
```

### Create

Create and start (or run) image as container

```sh
docker create --env=HOME=/home/your_user \
              --user="your_user"
              --interactive \
              --tty \
              --volume=/path/to/host/dir:/path/to/container/dir:ro \
              --entrypoint="/bin/bash"
              --name=your-container-name \
              --publish=your_external_port:your_internal_port \
              --publish=your_external_port_2:your_internal_port_2 \
              your/image-name \
              -l -c 'export LANG="C.UTF-8" \
                     && service postgresql start'
docker start your-container-name
```

Get response from published port (get internal port 5432 as 5433 port
from outside)

```sh
busybox telnet localhost 5433
```

#### Privileged

Run docker inside docker
<https://docs.docker.com/reference/commandline/cli/#create>

```sh
docker create --privileged --name=your-container-name your/image-name
```

### Run

```sh
docker run --detach
           --name=your-container-name \
           --publish=80:80 \
           your/image-name
```

### Inspect

```sh
docker inspect foobar_server
```

### Commit

Save container as image after interactive changes

```sh
docker commit your_user_name/your_container_name \
              your_image_name:1970_01_01
```

### Copy

Copy from container to host

```sh
docker cp <containerId>:/file/path/within/container /path/to/host/dir
```

Copy from host to container

```sh
docker cp /path/to/host/dir <containerId>:/file/path/within/container
```

## Registry

Push image to local registry repository  
<http://blog.docker.com/2013/07/how-to-use-your-own-registry/>

```sh
docker tag my-image-id localhost:63711/medapp-demo
docker push localhost:63711/medapp-demo
```

## Containers

### List

List all containers

```sh
docker ps --all --no-trunc
```

#### Json via socket

* <https://docs.docker.com/reference/api/docker_remote_api_v1.17/#list-containers>
* <http://superuser.com/questions/834307/can-curl-send-requests-to-sockets#834320>

```sh
echo -e "GET /containers/json?all=1 HTTP/1.1\r\n" \
  | socat unix-connect:/var/run/docker.sock STDIO
```

### Start

Start container and attach STDOUT and STDERR

```sh
docker start --attach teamcity_agent1
```

### Stop

```sh
docker stop teamcity_serve
```

### Remove

```sh
docker rm --force teamcity_agent1
```

#### Remove all stopped/running

```sh
docker rm $(docker ps --all --quiet)
```

### Rename

```sh
docker rename your-old-name your-new-name
```

### Stats

```sh
docker stats foobar_server
```

## Linking

<https://docs.docker.com/userguide/dockerlinks/#communication-across-links>

Create container with `--link` option like this

```sh
docker create --name your_container_name \
              --link your_linked_container_name:your_alias_name \
              your_image_name
```

Then environment variable `$YOUR_ALIAS_NAME_PORT_666_TCP_ADDR`
will contain linked container `IP` addres.

## Backup

### Save

<http://stackoverflow.com/questions/21486004/how-do-i-move-a-docker-containers-image-to-a-persistent-disk#21632989>

```sh
docker save image_name > image_name.tar
docker export container_name > image_name.tar
```

### Restore

```sh
docker load < image_name.tar
```

#### Import

Import will flatten and reduce image size
<https://www.ctl.io/developers/blog/post/optimizing-docker-images>

```sh
cat file.tar.gz | docker import - your-image-name
```

## init scripts

Host system init scripts (upstart or systemd)

<https://docs.docker.com/engine/admin/host_integration/#/examples>

## Log

```sh
docker logs -f your-container-name_1
```

## Cleanup

Cleanup/remove stopped containers/dangling images/build cache

```sh
docker system prune
```

## Login

```sh
docker login --username=your-user http://your.tld
```
