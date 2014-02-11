mbentley/ubuntu-django-uwsgi-nginx
==================

Note:  This is not ready for use and is currently broken

docker image for django (uwsgi) & nginx
based off of ubuntu:12.04

To pull this image:
`docker pull mbentley/ubuntu-django-uwsgi-nginx`

Example usage:
`docker run -p 80 -d mbentley/ubuntu-django-uwsgi-nginx`

By default, this just runs a default 'hello world' application.
