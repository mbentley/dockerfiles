mbentley/ubuntu-bind9
==================

docker image for bind9
based off of mbentley/ubuntu-base

Example usage, binding to an IP on the docker host:
`docker run -p <ip-address>:53:53 -p <ip-address>:53:53/udp -d mbentley/ubuntu-bind9`

By default, this image forwards all queries to 8.8.8.8 and 8.8.4.4 (Google's DNS servers)
