FROM ubuntu:12.04
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

RUN RUNLEVEL=1 DEBIAN_FRONTEND=noninteractive apt-get -y install python-software-properties software-properties-common wget supervisor
RUN wget --quiet --no-check-certificate -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN apt-get update
RUN RUNLEVEL=1 DEBIAN_FRONTEND=noninteractive apt-get -y install postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD run.sh /usr/local/bin/run

VOLUME ["/var/lib/postgresql/9.3/main", "/var/log/postgresql"]
CMD ["/usr/local/bin/run"]
