mbentley/ubuntu-pgbouncer
==================

docker image for pgbouncer
based off of ubuntu:14.04

To pull this image:
`docker pull mbentley/ubuntu-pgbouncer`

Example usage:
`docker run -i -t -d -p 6432:6432 --link postgres:pg mbentley/ubuntu-pgbouncer`

This requires a link (named pg) to a postgres container or manually configured environment variables as follows:

`PG_PORT_5432_TCP_ADDR` (default: <empty>)

`PG_PORT_5432_TCP_PORT` (default: <empty>)

`PG_ENV_POSTGRESQL_USER` (default: <empty>)

`PG_ENV_POSTGRESQL_PASS` (default: <empty>)

`PG_ENV_POSTGRESQL_MAX_CLIENT_CONN` (default: 10000)

`PG_ENV_POSTGRESQL_DEFAULT_POOL_SIZE` (default: 400)

`PG_ENV_POSTGRESQL_SERVER_IDLE_TIMEOUT` (default: 240)
 
Note: I would suggest using the `mbentley/ubuntu-postgres9.3` image with this as it includes the above environment variables.
