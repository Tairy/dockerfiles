FROM alpine
MAINTAINER Tairy <tairyguo@gmail.com>

ENV TIMEZONE Asia/Shanghai

RUN echo "http://mirrors.aliyun.com/alpine/v3.4/main" > /etc/apk/repositories \
  && echo "http://mirrors.aliyun.com/alpine/v3.4/community" >> /etc/apk/repositories

RUN apk update && \
  apk upgrade && \
  apk add --update tzdata && \
  cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
  echo "${TIMEZONE}" > /etc/timezone

RUN apk --update add wget \ 
  curl \
  git \
  grep \
  gmp-dev \
  libmcrypt-dev \
  freetype-dev \
  libxpm-dev \
  libwebp-dev \
  libjpeg-turbo-dev \
  libjpeg \
  bzip2-dev \
  openssl-dev \
  krb5-dev \
  libxml2-dev \
  build-base \
  tar \
  make \
  autoconf 

RUN apk --update add re2c bison curl-dev

RUN rm /var/cache/apk/*
ADD php-src /php-src
ADD script/install-php.sh /
ADD config/php.ini /
RUN chmod +x ./install-php.sh
RUN ./install-php.sh
RUN rm -rf /php-src
RUN mkdir -p /working
WORKDIR /working

# RUN pecl install mongodb-1.1.8

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]