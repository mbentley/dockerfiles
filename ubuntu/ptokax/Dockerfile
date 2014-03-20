FROM ubuntu:12.04
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y g++ make liblua5.1-0-dev zlib1g-dev supervisor wget

RUN wget -O /opt/0.5.0.1-nix-src.tgz http://www.PtokaX.org/files/0.5.0.1-nix-src.tgz
RUN (cd /opt && tar zxvf 0.5.0.1-nix-src.tgz)
RUN (cd /opt/PtokaX/skein && make)
RUN (cd /opt/PtokaX/tinyxml && make)
RUN (cd /opt/PtokaX && make)

ADD PtokaX.conf /etc/supervisor/conf.d/PtokaX.conf
ADD run.sh /usr/local/bin/run

EXPOSE 1209
EXPOSE 411
CMD ["/usr/local/bin/run"]
