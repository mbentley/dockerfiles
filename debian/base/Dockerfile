FROM debian:wheezy
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN echo "deb http://ftp.us.debian.org/debian wheezy main contrib non-free" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y nano
