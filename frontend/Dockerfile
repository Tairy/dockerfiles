FROM daocloud.io/ubuntu:14.04
MAINTAINER Tairy <tairyguo@gmail.com>

ADD scripts/install-base.sh /root/install-base.sh

RUN chmod +x /root/install-base.sh
RUN /bin/bash /root/install-base.sh
RUN apt-get -y install nginx

ADD config/default_site /etc/nginx/sites-enabled/default

EXPOSE 80

CMD nginx -g "daemon off;"