FROM ubuntu:latest
MAINTAINER Tairy <tairyguo@gmail.com>

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y upgrade

RUN apt-get install -y autoconf make wget vim build-essential git curl

RUN apt-get install -y python-pip
RUN pip install --default-timeout 6000 tornado pymongo

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

VOLUME ["/working", "/log"]

WORKDIR /working

EXPOSE 80

ENTRYPOINT ["python", "main.py", "--port=8888", "--debug=True"]

