FROM ubuntu:12.04
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y apt-cacher-ng

VOLUME ["/var/cache/apt-cacher-ng"]
EXPOSE 3142
CMD ["/usr/sbin/apt-cacher-ng","-c","/etc/apt-cacher-ng","pidfile=/var/run/apt-cacher-ng/pid","SocketPath=/var/run/apt-cacher-ng/socket","foreground=1"]
