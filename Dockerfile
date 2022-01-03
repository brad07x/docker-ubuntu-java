#
# Dockerfile for Ubuntu + Oracle JDK
#
FROM brad07x/ubuntu:bionic

# Image Metadata
LABEL org.opencontainers.image.authors="bstevens@havensight.net" \
      org.opencontainers.image.created="2022-01-02T22:22:05-05:00" \
      org.opencontainers.image.source="https://github.com/brad07x/docker-ubuntu-java" \
      org.opencontainers.image.documentation="https://github.com/brad07x/docker-ubuntu-java" \
      org.opencontainers.image.version="0.1.0-alpha" \
      org.opencontainers.image.title="Unofficial Ubuntu Bionic MultiArch Sismics Java Image" \
      org.opencontainers.image.description="Unofficial Ubuntu Bionic (18.04) MultiArch Sismics Java Image"

# Download and install JDK
RUN apt-get update && \
    apt-get -y -q install openjdk-11-jdk && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set Environment Variables
# Testing Wildcard to permit arch-agnostic JAVA_HOME path

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-*/
ENV JAVA_OPTS -Duser.timezone=America/New_York -Dfile.encoding=UTF-8 -Xmx1024m

# Test printing JAVA_HOME
RUN echo ${JAVA_HOME}
