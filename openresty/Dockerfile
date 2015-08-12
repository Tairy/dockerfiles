FROM ubuntu:latest
MAINTAINER Tairy <tairyguo@gmail.com>

ADD scripts/install-base.sh /root/install-base.sh
RUN chmod +x /root/install-base.sh
RUN /bin/bash /root/install-base.sh

RUN apt-get -y build-dep nginx \
    && apt-get -q -y clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN wget http://openresty.org/download/ngx_openresty-1.7.10.2.tar.gz \
  && tar xvfz ngx_openresty-1.7.10.2.tar.gz \
  && cd ngx_openresty-1.7.10.2 \
  && ./configure --with-luajit  --with-http_addition_module --with-http_dav_module --with-http_geoip_module --with-http_gzip_static_module --with-http_image_filter_module --with-http_realip_module --with-http_stub_status_module --with-http_ssl_module --with-http_sub_module --with-http_xslt_module --with-ipv6 --with-http_postgres_module --with-pcre-jit \
  && make \
  && make install \
  && rm -rf /ngx_openresty*

# install ruby and bundle
RUN wget https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz \
  && tar zxvf ruby-2.2.2.tar.gz \
  && cd ruby-2.2.2 \
  && ./configure \
  && make \
  && make install \
  && cd .. \
  && rm -rf /ruby* \
  && gem install bundle

# install
RUN git clone https://github.com/fluent/fluentd.git \
    && cd fluentd

RUN mkdir -p /tmp/sa/
RUN chmod 777 /tmp/sa/

EXPOSE 80

ADD config/nginx.conf /usr/local/openresty/nginx/nginx.conf

CMD /usr/local/openresty/nginx/sbin/nginx -c /usr/local/openresty/nginx/nginx.conf