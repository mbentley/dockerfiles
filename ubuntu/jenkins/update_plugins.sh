#!/bin/bash

SCRIPT_HOME="$( cd "$( dirname "$0" )" && pwd )"

cd $SCRIPT_HOME/plugins

#wget -nv -N --no-check-certificate http://updates.jenkins-ci.org/latest/cobertura.hpi
#wget -nv -N --no-check-certificate http://updates.jenkins-ci.org/latest/greenballs.hpi
#wget -nv -N --no-check-certificate http://updates.jenkins-ci.org/latest/instant-messaging.hpi
#wget -nv -N --no-check-certificate http://updates.jenkins-ci.org/latest/ircbot.hpi
#wget -nv -N --no-check-certificate http://updates.jenkins-ci.org/latest/postbuild-task.hpi
#wget -nv -N --no-check-certificate http://updates.jenkins-ci.org/latest/copy-to-slave.hpi
#wget -nv -N --no-check-certificate http://updates.jenkins-ci.org/latest/credentials.hpi
#wget -nv -N --no-check-certificate http://updates.jenkins-ci.org/latest/ssh-credentials.hpi
#wget -nv -N --no-check-certificate http://updates.jenkins-ci.org/latest/ssh-agent.hpi
#wget -nv -N --no-check-certificate http://updates.jenkins-ci.org/latest/git-client.hpi
#wget -nv -N --no-check-certificate http://updates.jenkins-ci.org/latest/git.hpi
#wget -nv -N --no-check-certificate http://updates.jenkins-ci.org/latest/github-api.hpi
#wget -nv -N --no-check-certificate http://updates.jenkins-ci.org/latest/github.hpi
#wget -nv -N --no-check-certificate http://updates.jenkins-ci.org/latest/scm-api.hpi
#wget -nv -N --no-check-certificate http://updates.jenkins-ci.org/latest/mercurial.hpi

wget -nv -N --no-check-certificate http://ftp-nyc.osuosl.org/pub/jenkins/plugins/cobertura/latest/cobertura.hpi
wget -nv -N --no-check-certificate http://ftp-nyc.osuosl.org/pub/jenkins/plugins/greenballs/latest/greenballs.hpi
wget -nv -N --no-check-certificate http://ftp-nyc.osuosl.org/pub/jenkins/plugins/instant-messaging/latest/instant-messaging.hpi
wget -nv -N --no-check-certificate http://ftp-nyc.osuosl.org/pub/jenkins/plugins/ircbot/latest/ircbot.hpi
wget -nv -N --no-check-certificate http://ftp-nyc.osuosl.org/pub/jenkins/plugins/postbuild-task/latest/postbuild-task.hpi
wget -nv -N --no-check-certificate http://ftp-nyc.osuosl.org/pub/jenkins/plugins/copy-to-slave/latest/copy-to-slave.hpi
wget -nv -N --no-check-certificate http://ftp-nyc.osuosl.org/pub/jenkins/plugins/credentials/latest/credentials.hpi
wget -nv -N --no-check-certificate http://ftp-nyc.osuosl.org/pub/jenkins/plugins/ssh-credentials/latest/ssh-credentials.hpi
wget -nv -N --no-check-certificate http://ftp-nyc.osuosl.org/pub/jenkins/plugins/ssh-agent/latest/ssh-agent.hpi
wget -nv -N --no-check-certificate http://ftp-nyc.osuosl.org/pub/jenkins/plugins/git-client/latest/git-client.hpi
wget -nv -N --no-check-certificate http://ftp-nyc.osuosl.org/pub/jenkins/plugins/git/latest/git.hpi
wget -nv -N --no-check-certificate http://ftp-nyc.osuosl.org/pub/jenkins/plugins/github-api/latest/github-api.hpi
wget -nv -N --no-check-certificate http://ftp-nyc.osuosl.org/pub/jenkins/plugins/github/latest/github.hpi
wget -nv -N --no-check-certificate http://ftp-nyc.osuosl.org/pub/jenkins/plugins/scm-api/latest/scm-api.hpi
wget -nv -N --no-check-certificate http://ftp-nyc.osuosl.org/pub/jenkins/plugins/mercurial/latest/mercurial.hpi
