FROM ubuntu:14.04
MAINTAINER Tairy <tairyguo@gmail.com>

# Run update
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt-get update --fix-missing \
    && apt-get -y upgrade

# Install Base
RUN apt-get install -y autoconf make wget vim build-essential git curl

RUN apt-get install -y python-dev

# Install nginx
RUN apt-get -y install nginx

# Add nginx config
ADD nginx_config /etc/nginx/sites-enabled/default

# Install pip
RUN apt-get -y install python-pip

# Install Sphinx
RUN pip install sphinx sphinx-autobuild sphinx_rtd_theme

EXPOSE 80
CMD nginx -g "daemon off;"