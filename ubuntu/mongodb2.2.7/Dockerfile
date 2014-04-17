FROM ubuntu:12.04
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y make gcc wget supervisor
RUN wget http://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.2.7.tgz -O /tmp/pkg.tar.gz
RUN mkdir -p /data/db
RUN ln -s /opt/mongodb/bin/mongo /usr/local/bin/mongo
RUN ln -s /opt/mongodb/bin/mongod /usr/local/bin/mongod
RUN (cd /tmp && tar zxf pkg.tar.gz && mv mongodb-* /opt/mongodb)
RUN rm -rf /tmp/*

ADD mongodb.conf /etc/supervisor/conf.d/mongodb.conf
ADD run.sh /usr/local/bin/run

EXPOSE 27017
EXPOSE 28017
CMD ["/usr/local/bin/run"]
