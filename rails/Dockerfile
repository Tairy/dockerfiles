FROM ubuntu:latest
MAINTAINER Tairy <tairyguo@gmail.com>

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt-get update --fix-missing \
    && apt-get -y upgrade

RUN apt-get install -y autoconf make wget vim build-essential git curl
RUN apt-get install -y htop man software-properties-common unzip
RUN apt-get install -y zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

RUN apt-get -y install supervisor && \
  mkdir -p /var/log/supervisor && \
  mkdir -p /etc/supervisor/conf.d

ADD supervisor.conf /etc/supervisor.conf

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /working

RUN git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
RUN echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
RUN git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
# RUN source ~/.bash_profile
RUN /root/.rbenv/bin/rbenv install -v 2.2.3
RUN /root/.rbenv/bin/rbenv global 2.2.3
# RUN gem install bundler
# RUN gem install rails
# RUN add-apt-repository ppa:chris-lea/node.js && \
#     apt-get update --fix-missing && \
#     apt-get -y install nodejs

CMD ["supervisord", "-c", "/etc/supervisor.conf"]