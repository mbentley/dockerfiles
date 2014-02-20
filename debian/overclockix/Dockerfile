FROM debian:wheezy
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN echo "deb http://ftp.us.debian.org/debian wheezy main contrib non-free" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git live-build
RUN mkdir /opt/live
ADD run.sh /usr/local/bin/run

VOLUME ["/opt/live"]
ENTRYPOINT ["/usr/local/bin/run"]
