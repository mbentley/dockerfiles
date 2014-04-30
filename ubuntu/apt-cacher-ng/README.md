mbentley/ubuntu-apt-cacher-ng
==================

docker image for apt-cacher-ng
based off of stackbrew/ubuntu:12.04

To pull this image:
`docker pull mbentley/ubuntu-apt-cacher-ng`

Example usage:
`docker run -i -t -p 3142:3142 -v /data/apt-cacher-ng:/var/cache/apt-cacher-ng mbentley/ubuntu-apt-cacher-ng`

In order to make other systems pull via the cache, you should create a file `/etc/apt/apt.conf` with the following lines:
    Acquire::http::Proxy "http://<docker-host>:3142";
    Acquire::HTTP::Proxy::get.docker.io "DIRECT";

Note:  The above assumes that you are mapping port 3142 on the docker host and 3142 is accessible from all machines.
