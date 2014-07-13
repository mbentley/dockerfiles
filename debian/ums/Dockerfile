FROM stackbrew/debian:wheezy
MAINTAINER Matt Bentley <mbentley@mbentley.net>
RUN (echo "deb http://http.debian.net/debian/ wheezy main contrib non-free" > /etc/apt/sources.list && echo "deb http://http.debian.net/debian/ wheezy-updates main contrib non-free" >> /etc/apt/sources.list && echo "deb http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list)
RUN apt-get update

ENV UMSVER 3.6.4
RUN DEBIAN_FRONTEND=noninteractive RUNLEVEL=1 apt-get install -y dcraw mediainfo mencoder mplayer openjdk-7-jre vlc wget

RUN dpkg --add-architecture i386
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive RUNLEVEL=1 apt-get install -y libfreetype6:i386 libstdc++6:i386

RUN (wget "http://sourceforge.net/projects/unimediaserver/files/Official%20Releases/Linux/UMS-${UMSVER}.tgz" -O /opt/UMS-${UMSVER}.tgz)
RUN (cd /opt && tar zxf UMS-${UMSVER}.tgz && rm UMS-${UMSVER}.tgz && mv ums-${UMSVER} ums)

ADD UMS.conf /opt/ums/UMS.conf
ADD WEB.conf /opt/ums/WEB.conf
ENV UMS_PROFILE /opt/ums/UMS.conf

EXPOSE 5001
CMD ["/opt/ums/UMS.sh"]

