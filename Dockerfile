#docker
FROM tomcat:8-alpine

RUN rm -rf /usr/local/tomcat/webapps/*
COPY target/helloworld.war /usr/local/tomcat/webapps/ROOT.war

