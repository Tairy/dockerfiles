FROM ubuntu:latest
MAINTAINER Tairy <tairyguo@gmail.com>

RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list \
    && apt-get update --fix-missing \
    && apt-get -y upgrade \
    && apt-get install -y autoconf make wget vim build-essential git curl \
    && apt-get install -y htop man software-properties-common unzip \
    && apt-get -y install supervisor \
    && mkdir -p /var/log/supervisor \
    && mkdir -p /etc/supervisor/conf.d \
    && apt-get -y install haproxy \
    && rm -rf /var/lib/apt/lists/*

ADD supervisor.conf /etc/supervisor.conf
ADD haproxy.conf /etc/haproxy.conf

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /etc/haproxy

CMD ["supervisord", "-c", "/etc/supervisor.conf"]

EXPOSE 80
EXPOSE 443