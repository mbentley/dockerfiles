FROM stackbrew/debian:jessie
MAINTAINER Matt Bentley <mbentley@mbentley.net>
RUN (echo "deb http://http.debian.net/debian/ jessie main contrib non-free" > /etc/apt/sources.list && echo "deb http://http.debian.net/debian/ jessie-updates main contrib non-free" >> /etc/apt/sources.list && echo "deb http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list)
RUN apt-get update

ENV TOMCATVER 7.0.55

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install patch wget
RUN (wget --progress=dot --no-check-certificate -O /tmp/server-jre-7u65-linux-x64.tar.gz --header "Cookie: oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/7u65-b17/jdk-7u65-linux-x64.tar.gz && \
	echo "c223bdbaf706f986f7a5061a204f641f  /tmp/server-jre-7u65-linux-x64.tar.gz" | md5sum -c > /dev/null 2>&1 || echo "ERROR: MD5SUM MISMATCH" && \
	tar xzf /tmp/server-jre-7u65-linux-x64.tar.gz && \
	mkdir -p /usr/lib/jvm/java-7-oracle && \
	mv jdk1.7.0_65/jre /usr/lib/jvm/java-7-oracle/jre && \
	rm -rf jdk1.7.0_65 && rm /tmp/server-jre-7u65-linux-x64.tar.gz && \
	chown root:root -R /usr/lib/jvm/java-7-oracle)
RUN (update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-7-oracle/jre/bin/java 1 && update-alternatives --set java /usr/lib/jvm/java-7-oracle/jre/bin/java)

RUN (wget -O /tmp/tomcat7.tar.gz http://mirror.cogentco.com/pub/apache/tomcat/tomcat-7/v${TOMCATVER}/bin/apache-tomcat-${TOMCATVER}.tar.gz && \
        cd /opt && \
        tar zxf /tmp/tomcat7.tar.gz && \
        rm /tmp/tomcat7.tar.gz && \
        mv /opt/apache-tomcat* /opt/tomcat)

ADD ./run.sh /usr/local/bin/run

ADD server.xml.patch /tmp/server.xml.patch
RUN (patch -N /opt/tomcat/conf/server.xml /tmp/server.xml.patch && rm /tmp/server.xml.patch)

### to deploy a specific war to ROOT, uncomment the following 2 lines and specify the appropriate .war
#RUN rm -rf /opt/tomcat/webapps/docs /opt/tomcat/webapps/examples /opt/tomcat/webapps/ROOT
#ADD yourfile.war /opt/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["/bin/sh", "-e", "/usr/local/bin/run"]
