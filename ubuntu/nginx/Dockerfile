FROM ubuntu:12.04
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y nginx supervisor

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80
CMD ["/usr/bin/supervisord"]
