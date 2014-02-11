mbentley/ubuntu-postgres9.3
==================

docker image for postgres 9.3
based off of ubuntu:12.04

To pull this image:
`docker pull mbentley/ubuntu-postgres9.3`

Example usage:
`docker run -p 5432:5432 -e POSTGRESQL_USER=postgres  -e POSTGRESQL_PASS=password  -e POSTGRESQL_DB=mydb -d mbentley/ubuntu-postgres9.3`

The following environment variables can be passed to the docker image:

`POSTGRESQL_USER` (default: docker)

`POSTGRESQL_PASS` (default: docker)

`POSTGRESQL_DB` (default: docker)
