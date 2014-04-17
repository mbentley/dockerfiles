FROM ubuntu:12.04
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

ENV TOMCATVER 7.0.53

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-7-jre-headless wget
RUN wget -O /tmp/tomcat7.tar.gz http://mirror.cogentco.com/pub/apache/tomcat/tomcat-7/v${TOMCATVER}/bin/apache-tomcat-${TOMCATVER}.tar.gz
RUN (cd /opt && tar zxf /tmp/tomcat7.tar.gz)
RUN (mv /opt/apache-tomcat* /opt/tomcat)
ADD ./run.sh /usr/local/bin/run

### to deploy a specific war to ROOT, uncomment the following 2 lines and specify the appropriate .war
#RUN rm -rf /opt/tomcat/webapps/docs /opt/tomcat/webapps/examples /opt/tomcat/webapps/ROOT
#ADD yourfile.war /opt/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["/bin/sh", "-e", "/usr/local/bin/run"]
