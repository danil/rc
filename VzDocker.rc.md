# [Docker][] rc

[docker]: https://github.com/docker

* HOWTO Images list `docker images` <sup><sub>Size and so on.</sub></sup>
* HOWTO Image build `docker build --tag=your-ropo/your-img:your-tag --file=path/to/Dockerfile ./`
* HOWTO Image tag add `docker tag your-img-hash your/img-nm`
* HOWTO Image tag remove `docker rmi your-ropo/your-img:your-tag` <sup><sub>[1947444523][]</sub></sup>
* HOWTO Image tag remove all `docker rmi $(docker images --quiet)`

[1947444523]: https://serverfault.com/questions/703344/how-to-remove-an-image-tag-in-docker-without-removing-the-image-itself#703352

## Image create <sup><sub>create and start/run image as container</sub></sup>

    docker create --env=HOME=/home/your_usr \
                  --user="your_usr"
                  --interactive \
                  --tty \
                  --volume=/path/to/host/dir:/path/to/container/dir:ro \
                  --entrypoint="/bin/bash"
                  --name=your-container-nm \
                  --publish=your_external_port:your_internal_port \
                  --publish=your_external_port_2:your_internal_port_2 \
                  your/img-nm \
                  -l -c 'export LANG="C.UTF-8" \
                         && service postgresql start'
    docker start your-container-nm

Get response from published port (get internal port 5432 as 5433 port
from outside)

    busybox telnet localhost 5433

## Image crate privileged <sup><sub>run docker inside docker [2652317084][]</sub></sup>

    docker create --privileged --name=your-container-nm your/img-nm

[2652317084]: https://docs.docker.com/reference/commandline/cli/#create

## Image run

    docker run --detach
               --name=your-container-nm \
               --publish=80:80 \
               your/img-nm

## Image inspect

    docker inspect foobar_server

## Image commit <sup><sub>save container as image after interactive changes</sub></sup>

    docker commit your_usr_nm/your_container_nm your_img_nm:1970_01_01

## Copy to container <sub><sub>copy from container to host</sub></sup>

    docker cp <containerId>:/file/path/within/container /path/to/host/dir

Copy from host to container

    docker cp /path/to/host/dir <containerId>:/file/path/within/container

## Registry <sup><sub>push image to local registry repository</sub></sup>

    docker tag your-img-id localhost:63711/medapp-demo
    docker push localhost:63711/medapp-demo

## Containers list <sup><sub>list all containers</sub></sup>

    docker ps --all --no-trunc

## Container list as json via socket

* <https://docs.docker.com/reference/api/docker_remote_api_v1.17/#list-containers>
* <http://superuser.com/questions/834307/can-curl-send-requests-to-sockets#834320>

    echo -e "GET /containers/json?all=1 HTTP/1.1\r\n" \
      | socat unix-connect:/var/run/docker.sock STDIO

## Container start <sup><sub>start container and attach STDOUT and STDERR</sub></sup>

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

## Linking <sup><sub>create container with `--link` option like this [3880151314][]</sub></sup>

    docker create --name your_container_nm \
                  --link your_linked_container_nm:your_alias_nm \
                  your_img_nm

Then environment variable `$YOUR_ALIAS_NM_PORT_666_TCP_ADDR`
will contain linked container `IP` addres.

[3880151314]: https://docs.docker.com/userguide/dockerlinks/#communication-across-links

## Backup save <sup><sub>[1142383923][]</sub></sup>

    docker save your_img_nm > your_img_nm.tar
    docker export container_nm > your_img_nm.tar

[1142383923]: http://stackoverflow.com/questions/21486004/how-do-i-move-a-docker-containers-image-to-a-persistent-disk#21632989

## Backup restore

    docker load < your_img_nm.tar

## Backup import <sup><sub>import will flatten and reduce image size [3969143878][]</sub></sup>

    cat file.tar.gz | docker import - your-img-nm

[3969143878]: https://www.ctl.io/developers/blog/post/optimizing-docker-images

## init scripts <sup><sub>host system init scripts (upstart or systemd) [404518290][]</sub></sup>

[404518290]: https://docs.docker.com/engine/admin/host_integration/#/examples

## Log

    docker logs -f your-container-nm_1

## Cleanup <sup><sub>cleanup/remove stopped containers/dangling images/build cache</sub></sup>

    docker system prune

## Login

    docker login --username=your-user http://your.tld
