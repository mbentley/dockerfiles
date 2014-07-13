FROM stackbrew/ubuntu:14.04
MAINTAINER Matt Bentley <mbentley@mbentley.net>
RUN apt-get update

ENV UMSVER 3.6.4
RUN DEBIAN_FRONTEND=noninteractive RUNLEVEL=1 apt-get install -y mediainfo openjdk-7-jre dcraw vlc wget
RUN DEBIAN_FRONTEND=noninteractive RUNLEVEL=1 apt-get install -y mplayer
RUN (wget "http://sourceforge.net/projects/unimediaserver/files/Official%20Releases/Linux/UMS-${UMSVER}.tgz" -O /opt/UMS-${UMSVER}.tgz)
RUN (cd /opt && tar zxf UMS-${UMSVER}.tgz && rm UMS-${UMSVER}.tgz && mv ums-${UMSVER} ums)

ADD UMS.conf /opt/ums/UMS.conf
ENV UMS_PROFILE /opt/ums/UMS.conf

EXPOSE 5001
CMD ["/opt/ums/UMS.sh"]

