FROM tomcat-jdk:latest
MAINTAINER sebastian@pixelmilk.com

ENV JAVA_OPTS "-Dcrowd.home=/var/run/crowd"

COPY conf/crowd.xml /usr/local/tomcat/conf/Catalina/localhost/
COPY lib/ /usr/local/tomcat/lib

RUN /bin/bash -c 'rm -rf /usr/local/tomcat/webapps/* ; \
    cd /tmp ; \
    curl -O -L -sS https://www.atlassian.com/software/crowd/downloads/binary/atlassian-crowd-2.10.1-war.zip ; \
    unzip -d /usr/local/tomcat/webapps atlassian-crowd-2.10.1-war.zip ; \
    set -x ["$JAVA_OPTS" = "-Dcrowd.home=/var/crowd-home"]'