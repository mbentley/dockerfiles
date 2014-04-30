mbentley/ubuntu-nginx
==================

docker image for nginx
based off of stackbrew/ubuntu:12.04

To pull this image:
`docker pull mbentley/ubuntu-nginx`

Example usage:
`docker run -i -t -p 80 -v /data/logs:/var/log/nginx -v /data/www:/var/www mbentley/ubuntu-nginx`

By default, this just runs a basic nginx server that listens on port 80.  The default webroot is `/var/www`.
