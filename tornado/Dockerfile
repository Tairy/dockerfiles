FROM ubuntu:latest
MAINTAINER Tairy <tairyguo@gmail.com>

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && apt-get update --fix-missing \
    && apt-get -y upgrade

RUN apt-get install -y autoconf make wget vim build-essential git curl
RUN apt-get install -y htop man software-properties-common unzip

RUN apt-get -y install supervisor && \
  mkdir -p /var/log/supervisor && \
  mkdir -p /etc/supervisor/conf.d

ADD supervisor.conf /etc/supervisor.conf

RUN apt-get install -y python-pip
RUN pip install --default-timeout 6000 tornado pymongo

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

VOLUME ["/working", "/log"]

WORKDIR /working

EXPOSE 80

CMD ["supervisord", "-c", "/etc/supervisor.conf"]
# ENTRYPOINT ["python", "main.py", "--port=8888", "--debug=True"]