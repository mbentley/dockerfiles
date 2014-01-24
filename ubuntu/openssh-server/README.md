mbentley/ubuntu-openssh-server
==================

docker image for openssh-server
based off of ubuntu:12.04

To pull this image:
`docker pull mbentley/ubuntu-openssh-server`

Example usage:
`docker run -p 22 -d mbentley/ubuntu-openssh-server`

By default, the root user has my public key.
