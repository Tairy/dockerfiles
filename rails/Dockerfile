FROM ubuntu:latest
MAINTAINER Tairy <tairyguo@gmail.com>

# Install Ruby and Rails dependencies
RUN apt-get update && apt-get install -y \
  ruby \
  ruby-dev \
  build-essential \   
  libxml2-dev \       
  libxslt1-dev \      
  zlib1g-dev \        
  libsqlite3-dev \
  nodejs \
  vim

RUN gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/

# Install Rails
RUN gem install rails

RUN bundle config mirror.https://rubygems.org https://ruby.taobao.org

# Create a new Rails app under /src/SF_Hackathon
RUN mkdir -p /src && cd /src && rails new hackathon
WORKDIR /src/hackathon
RUN bundle install

# Default command is to run a rails server on port 3000
CMD ["rails", "server", "--binding", "0.0.0.0", "--port", "3000"]
# CMD ["/bin/bash"]
EXPOSE 3000