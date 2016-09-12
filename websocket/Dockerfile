FROM daocloud.io/ubuntu:14.04
MAINTAINER Tairy <tairyguo@gmail.com>

# Run update
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt-get update --fix-missing \
    && apt-get -y upgrade

    # Install dependencies
RUN apt-get install -y git-core \
    curl zlib1g-dev build-essential \
    libssl-dev libreadline-dev

RUN apt-get install -y nodejs npm

ADD socket /socket

WORKDIR /socket
RUN npm --registry=https://registry.npm.taobao.org install
EXPOSE 4000
CMD nodejs index.js