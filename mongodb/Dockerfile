FROM ubuntu:latest
MAINTAINER Tairy <tairyguo@gmail.com>


RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list \
    && apt-get update --fix-missing \
    && apt-get -y upgrade

# Install MongoDB.
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org && \
  rm -rf /var/lib/apt/lists/*

VOLUME ["/data/db"]

WORKDIR /data

CMD ["mongod"]

# Expose ports.
#   - 27017: process
#   - 28017: http

EXPOSE 27017
EXPOSE 28017