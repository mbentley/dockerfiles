FROM mbentley/ubuntu-base
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
RUN apt-get install -y openssh-server supervisor

RUN mkdir -p /var/run/sshd
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22
CMD ["/usr/bin/supervisord"]
