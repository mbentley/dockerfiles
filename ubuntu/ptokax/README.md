mbentley/ubuntu-ptokax
==================

docker image for ptokax
based off of stackbrew/ubuntu:12.04

To pull this image:
`docker pull mbentley/ubuntu-ptokax`

Example usage:
`docker run -i -t -e HUB=myhub.mydomain -e NICK=admin -e PASSWORD=password -p 1209:1209 -p 411:411 mbentley/ubuntu-ptokax`
