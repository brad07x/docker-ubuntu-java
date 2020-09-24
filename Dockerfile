#
# Dockerfile for Ubuntu + Oracle JDK
#
FROM sismics/ubuntu:bionic
MAINTAINER Benjamin Gamard <b.gamard@sismics.com>

# Download and install JDK
RUN apt-get update && \
    apt-get -y -q install openjdk-11-jdk && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
ENV JAVA_OPTS -Duser.timezone=Europe/Paris -Dfile.encoding=UTF-8 -Xmx1024m
