FROM mbentley/debian-base
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

RUN apt-get install -y memcached
ENTRYPOINT ["memcached"]
USER daemon
EXPOSE 11211
