mbentley/ubuntu-mongodb2.4.10
==================

docker image for mongodb
based off of stackbrew/ubuntu:12.04

To pull this image:
`docker pull mbentley/ubuntu-mongodb2.4.10`

Example usage:
`docker run -i -t -d -p 27017:27017 -p 28017:28017 -e MONGODB_USER=admin -e MONGODB_PASS=mongo -e MONGODB_DB=mongo mbentley/ubuntu-mongodb2.4.10`

The following environment variables can be passed to the docker image:

`MONGODB_USER` (default: admin)

`MONGODB_PASS` (default: mongo)

`MONGODB_DB` (default: mongo)
