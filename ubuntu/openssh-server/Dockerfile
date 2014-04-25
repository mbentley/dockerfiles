FROM ubuntu:12.04
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server

ADD authorized_keys /authorized_keys
ADD configure.sh /configure.sh
RUN bin/bash /configure.sh && rm /configure.sh

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
