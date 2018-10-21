#
# Dockerfile for Ubuntu + Oracle JDK
#

FROM sismics/ubuntu:bionic
MAINTAINER Benjamin Gamard <b.gamard@sismics.com>

# Download and install JDK
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C2518248EEA14886
RUN add-apt-repository -y "deb http://ppa.launchpad.net/webupd8team/java/ubuntu bionic main"
RUN apt-get update && \
    echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
    apt-get -y -q install oracle-java8-installer oracle-java8-unlimited-jce-policy

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle/
ENV JAVA_OPTS -Duser.timezone=Europe/Paris -Dfile.encoding=UTF-8 -Xmx1024m
