FROM mbentley/ubuntu-base
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
RUN apt-get install -y openssh-server supervisor

ADD authorized_keys /authorized_keys
ADD configure.sh /configure.sh
RUN bin/bash /configure.sh && rm /configure.sh

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22
CMD ["/usr/bin/supervisord"]
