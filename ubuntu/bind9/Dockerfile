FROM mbentley/ubuntu-base
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
RUN apt-get install -y bind9 supervisor

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD named.conf.options /etc/bind/named.conf.options

EXPOSE 53
CMD ["/usr/bin/supervisord"]
