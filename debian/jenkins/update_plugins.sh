#!/bin/bash

SCRIPT_HOME="$( cd "$( dirname "$0" )" && pwd )"

cd $SCRIPT_HOME/plugins

plugins="cobertura greenballs instant-messaging ircbot postbuild-task copy-to-slave credentials ssh-credentials ssh ssh-agent git-client git github-api github scm-api mercurial grails"

for i in ${plugins}
do
	#wget -nv -N --no-check-certificate https://updates.jenkins-ci.org/latest/${i}.hpi
	wget -nv -N --no-check-certificate http://ftp-nyc.osuosl.org/pub/jenkins/plugins/${i}/latest/${i}.hpi
done
