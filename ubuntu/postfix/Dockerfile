FROM ubuntu:12.04
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postfix supervisor

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 25
CMD ["/usr/bin/supervisord"]
