FROM stackbrew/debian:wheezy
MAINTAINER Matt Bentley <mbentley@mbentley.net>
RUN (echo "deb http://http.debian.net/debian/ wheezy main contrib non-free" > /etc/apt/sources.list && echo "deb http://http.debian.net/debian/ wheezy-updates main contrib non-free" >> /etc/apt/sources.list && echo "deb http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list)
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git live-build transmission-cli
RUN mkdir /opt/live
ADD run.sh /usr/local/bin/run

VOLUME ["/opt/live"]
ENTRYPOINT ["/usr/local/bin/run"]
CMD ["bash"]
