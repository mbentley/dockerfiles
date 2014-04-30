FROM stackbrew/ubuntu:12.04
MAINTAINER Matt Bentley <mbentley@mbentley.net>
RUN (echo "deb http://archive.ubuntu.com/ubuntu/ precise main restricted universe multiverse" > /etc/apt/sources.list && echo "deb http://archive.ubuntu.com/ubuntu/ precise-updates main restricted universe multiverse" >> /etc/apt/sources.list && echo "deb http://archive.ubuntu.com/ubuntu/ precise-backports main restricted universe multiverse" >> /etc/apt/sources.list && echo "deb http://archive.ubuntu.com/ubuntu/ precise-security main restricted universe multiverse" >> /etc/apt/sources.list)
RUN apt-get update

ENV TOMCATVER 7.0.53

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install wget
RUN wget --progress=bar --no-check-certificate -O /tmp/server-jre-7u51-linux-x64.tar.gz --header "Cookie: oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/7u51-b13/server-jre-7u51-linux-x64.tar.gz
RUN echo "c5a034f4222bac326101799bcb20509c  /tmp/server-jre-7u51-linux-x64.tar.gz" | md5sum -c > /dev/null 2>&1 || echo "ERROR: MD5SUM MISMATCH"
RUN tar xzf /tmp/server-jre-7u51-linux-x64.tar.gz 
RUN mkdir -p /usr/lib/jvm/java-7-oracle 
RUN mv jdk1.7.0_51/jre /usr/lib/jvm/java-7-oracle/jre 
RUN rm -rf jdk1.7.0_51 && rm /tmp/server-jre-7u51-linux-x64.tar.gz
RUN chown root:root -R /usr/lib/jvm/java-7-oracle
RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-7-oracle/jre/bin/java 1
RUN update-alternatives --set java /usr/lib/jvm/java-7-oracle/jre/bin/java

RUN wget -O /tmp/tomcat7.tar.gz http://mirror.cogentco.com/pub/apache/tomcat/tomcat-7/v${TOMCATVER}/bin/apache-tomcat-${TOMCATVER}.tar.gz
RUN (cd /opt && tar zxf /tmp/tomcat7.tar.gz)
RUN (mv /opt/apache-tomcat* /opt/tomcat)
ADD ./run.sh /usr/local/bin/run

### to deploy a specific war to ROOT, uncomment the following 2 lines and specify the appropriate .war
#RUN rm -rf /opt/tomcat/webapps/docs /opt/tomcat/webapps/examples /opt/tomcat/webapps/ROOT
#ADD yourfile.war /opt/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["/bin/sh", "-e", "/usr/local/bin/run"]
