FROM ubuntu:14.04
MAINTAINER Tairy <tairyguo@gmail.com>

# Run update
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt-get update --fix-missing \
    && apt-get -y upgrade

# Install dependencies
RUN apt-get install -y git-core \
    curl zlib1g-dev build-essential \
    libssl-dev libreadline-dev

RUN apt-get install -y libyaml-dev \
    libsqlite3-dev sqlite3 libxml2-dev \
    libxslt1-dev libcurl4-openssl-dev \
    python-software-properties libffi-dev

# Install rbenv
RUN git clone git://github.com/sstephenson/rbenv.git /root/.rbenv \
    && echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /root/.bashrc \
    && echo 'eval "$(rbenv init -)"' >> /root/.bashrc \
    && git clone git://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build

RUN git clone https://github.com/andorchen/rbenv-china-mirror.git /root/.rbenv/plugins/rbenv-china-mirror

ENV PATH=$PATH:/root/.rbenv/plugins/ruby-build/bin:/root/.rbenv/shims:/root/.rbenv/bin

# Install ruby
RUN rbenv install -v 2.3.1 \
    && rbenv global 2.3.1 \
    && echo "gem: --no-document" > /root/.gemrc \
    && gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/ \
    && gem install bundler \
    && gem install github-pages

# ADD templates /working
WORKDIR /working

EXPOSE 4000
CMD bundler install && jekyll serve -H 0.0.0.0 --watch