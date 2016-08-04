FROM ubuntu:16.10
MAINTAINER Tairy <tairyguo@gmail.com>

# Run update
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt-get update --fix-missing \
    && apt-get -y upgrade

# Install dependencies
RUN apt-get install -y git-core \
    curl zlib1g-dev build-essential \
    libssl-dev libreadline-dev

RUN apt-get update --fix-missing
RUN apt-get install -y libyaml-dev \
    libsqlite3-dev sqlite3 libxml2-dev \
    libxslt1-dev libcurl4-openssl-dev \
    python-software-properties libffi-dev

# Install rbenv
RUN git clone git://github.com/sstephenson/rbenv.git /root/.rbenv \
    && echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /root/.bashrc \
    && echo 'eval "$(rbenv init -)"' >> /root/.bashrc \
    && git clone git://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build \
    && echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> /root/.bashrc

RUN git clone https://github.com/andorchen/rbenv-china-mirror.git /root/.rbenv/plugins/rbenv-china-mirror
# RUN /bin/bash -c "source /root/.bashrc"

# Install ruby
RUN /root/.rbenv/bin/rbenv install -v 2.3.1 \
    && /root/.rbenv/bin/rbenv global 2.3.1 \
    && echo "gem: --no-document" > /root/.gemrc \
    && /root/.rbenv/shims/gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/ \
    && /root/.rbenv/shims/gem install bundler \
    && /root/.rbenv/shims/gem install rails \
    && /root/.rbenv/bin/rbenv rehash
RUN apt-get install -y software-properties-common python-software-properties
# Install nodejs
RUN apt-get -y install nodejs

RUN /root/.rbenv/shims/bundle config --global frozen 1
RUN /root/.rbenv/shims/bundle config --global silence_root_warning 1

# Run project
RUN mkdir -p /working
WORKDIR /working
ONBUILD COPY Gemfile /working
ONBUILD COPY Gemfile.lock /working
ONBUILD RUN /root/.rbenv/shims/bundle install --no-deployment
ONBUILD COPY . /working

RUN apt-get install -y vim inetutils-ping