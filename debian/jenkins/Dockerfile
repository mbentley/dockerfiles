FROM stackbrew/debian:jessie
MAINTAINER Matt Bentley <mbentley@mbentley.net>
RUN (echo "deb http://http.debian.net/debian/ jessie main contrib non-free" > /etc/apt/sources.list && echo "deb http://http.debian.net/debian/ jessie-updates main contrib non-free" >> /etc/apt/sources.list && echo "deb http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list)
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl wget openjdk-7-jre-headless git-core mercurial libpcre3-dev build-essential libssl-dev libexpat-dev libpam-dev
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN echo "deb http://pkg.jenkins-ci.org/debian binary/" > /etc/apt/sources.list.d/jenkins.list
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive RUNLEVEL=1 apt-get install -y jenkins
RUN (wget --output-document=/usr/local/bin/docker https://get.docker.io/builds/Linux/x86_64/docker-latest && chmod +x /usr/local/bin/docker)
RUN mkdir -p /var/lib/jenkins/plugins
ADD plugins/ /var/lib/jenkins/plugins/
RUN echo "java -jar /usr/share/jenkins/jenkins.war" > /usr/local/bin/run && chmod +x /usr/local/bin/run
ENV JENKINS_HOME /var/lib/jenkins

VOLUME /var/lib/jenkins
EXPOSE 8080
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]
