FROM stackbrew/debian:jessie
MAINTAINER Matt Bentley <mbentley@mbentley.net>
RUN (echo "deb http://http.debian.net/debian/ jessie main contrib non-free" > /etc/apt/sources.list && echo "deb http://http.debian.net/debian/ jessie-updates main contrib non-free" >> /etc/apt/sources.list && echo "deb http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list)
RUN apt-get update

ENV TOMCATVER 7.0.55

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-7-jre-headless wget
RUN (wget -O /tmp/tomcat7.tar.gz http://mirror.cogentco.com/pub/apache/tomcat/tomcat-7/v${TOMCATVER}/bin/apache-tomcat-${TOMCATVER}.tar.gz && \
	cd /opt && \
	tar zxf /tmp/tomcat7.tar.gz && \
	mv /opt/apache-tomcat* /opt/tomcat && \
	rm /tmp/tomcat7.tar.gz)

ADD ./run.sh /usr/local/bin/run

### to deploy a specific war to ROOT, uncomment the following 2 lines and specify the appropriate .war
#RUN rm -rf /opt/tomcat/webapps/docs /opt/tomcat/webapps/examples /opt/tomcat/webapps/ROOT
#ADD yourfile.war /opt/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["/bin/sh", "-e", "/usr/local/bin/run"]
