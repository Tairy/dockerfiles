FROM daocloud.io/ubuntu:14.04
MAINTAINER Tairy <tairyguo@gmail.com>

# Install Base.
RUN \
  sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget

RUN apt-get -y install mysql-server

EXPOSE 3306

CMD ["mysqld"]