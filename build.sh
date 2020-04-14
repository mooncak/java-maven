#!/bin/bash
Gitdir=${Gitdir:-helloworld}
#
echo 'docker run maven --------'
docker run --rm \
 -v /docker/cicd/maven-settings.xml:/usr/share/maven/conf/settings.xml \
 -v /docker/cicd/maven-data:/repository \
 -v /docker/cicd/jenkins-data/workspace/:/git/ \
 maven:alpine \
 mvn clean package -f /git/$Gitdir/pom.xml
#
echo 'docker build --------'
cd /docker/cicd/jenkins-data/workspace/$Gitdir
docker build -t helloworld .
docker images helloworld
#
echo "docker run helloworld --------"
docker rm -f helloworld
sleep 1
[[ `netstat -lntp |grep 8090 |wc -l` -ge 1 ]] && { echo "Port 8090 is used";exit; }
docker run -dit --name helloworld -p 8090:8080 helloworld
[[ -n `docker ps |awk '/8090/{print $1}'` ]] && { echo "run helloworld successful"; } || { echo "run helloworld error"; }
docker ps -l

