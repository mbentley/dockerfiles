FROM ubuntu:12.04
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

RUN RUNLEVEL=1 DEBIAN_FRONTEND=noninteractive apt-get install -y wget openjdk-6-jre-headless git-core
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN echo "deb http://pkg.jenkins-ci.org/debian binary/" > /etc/apt/sources.list.d/jenkins.list
RUN apt-get update
RUN RUNLEVEL=1 DEBIAN_FRONTEND=1 apt-get install -y jenkins
RUN (wget --output-document=/usr/local/bin/docker https://get.docker.io/builds/Linux/x86_64/docker-latest && chmod +x /usr/local/bin/docker)
RUN mkdir -p /var/lib/jenkins/plugins
RUN (cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/cobertura.hpi)
RUN (cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/greenballs.hpi)
RUN (cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/instant-messaging.hpi)
RUN (cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/ircbot.hpi)
RUN (cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/postbuild-task.hpi)
RUN (cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/copy-to-slave.hpi)
RUN (cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/credentials.hpi)
RUN (cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/ssh-credentials.hpi)
RUN (cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/ssh-agent.hpi)
RUN (cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/git-client.hpi)
RUN (cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/git.hpi)
RUN (cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/scm-api.hpi)
RUN echo "java -jar /usr/share/jenkins/jenkins.war" > /usr/local/bin/run && chmod +x /usr/local/bin/run
ENV JENKINS_HOME /var/lib/jenkins

EXPOSE 8080
VOLUME /var/lib/jenkins
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]
