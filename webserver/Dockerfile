FROM ubuntu:latest
MAINTAINER Tairy <tairyguo@gmail.com>

ADD scripts/install-base.sh /root/install-base.sh

RUN chmod +x /root/install-base.sh
RUN /bin/bash /root/install-base.sh
RUN apt-get -y install mysql-server
RUN apt-get -y install nginx
RUN apt-get -y install php5-mysql php5-fpm

ADD config/php_site /etc/nginx/php_site
ADD config/default_site /etc/nginx/sites-enabled/default

EXPOSE 80

CMD php5-fpm && nginx -g "daemon off;"