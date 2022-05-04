FROM tomcat:8.0.20-jre8

MAINTAINER sagude

RUN mkdir /usr/local/tomcat/webapps/myapp

COPY target/trucks.war /usr/local/tomcat/webapps
