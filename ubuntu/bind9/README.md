mbentley/ubuntu-bind9
==================

docker image for bind9
based off of stackbrew/ubuntu:12.04

To pull this image:
`docker pull mbentley/ubuntu-bind9`

Example usage, binding to all IPs on the docker host:
`docker run -i -t -d -p 53:53 -p 53:53/udp mbentley/ubuntu-bind9`

Example usage, binding to a specific IP on the docker host:
`docker run -i -t -d -p <ip-address>:53:53 -p <ip-address>:53:53/udp mbentley/ubuntu-bind9`

By default, this image forwards all queries to 8.8.8.8 and 8.8.4.4 (Google's DNS servers)
