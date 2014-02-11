FROM ubuntu:12.04
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/postgres.list

RUN RUNLEVEL=1 DEBIAN_FRONTEND=noninteractive apt-get install -y wget
RUN wget --quiet --no-check-certificate -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN RUNLEVEL=1 DEBIAN_FRONTEND=noninteractive apt-get install -y supervisor postgresql-9.3 pgadmin3

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD run.sh /usr/local/bin/run

VOLUME ["/data"]
VOLUME ["/var/log/postgresql"]
EXPOSE 5432
CMD ["/usr/local/bin/run"]
