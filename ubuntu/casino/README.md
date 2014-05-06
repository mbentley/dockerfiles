mbentley/ubuntu-casino
==================

docker image for CASino (http://casino.rbcas.com/)
based off of stackbrew/ubuntu:12.04

To pull this image:
`docker pull mbentley/ubuntu-casino`

Example usage:
`docker run -i -t -p 3000:3000 --link postgres:pg mbentley/ubuntu-casino`

This is a customized image that will probably only work in a very specific environment.
