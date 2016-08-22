FROM ubuntu:14.04
MAINTAINER Tairy <tairyguo@gmail.com>

ADD scripts /root
ADD config/supervisor_config /etc/supervisor.conf
ADD config/nginx_config /etc/nginx/sites-enabled/default

RUN chmod +x /root/install-base.sh /root/install-php.sh /root/install-nginx.sh /root/install-supervisor.sh

RUN /bin/bash /root/install-base.sh
RUN /bin/bash /root/install-nginx.sh
RUN /bin/bash /root/install-php.sh
RUN /bin/bash /root/install-supervisor.sh

RUN service php7.0-fpm start

WORKDIR /working
EXPOSE 80

CMD ["supervisord", "-c", "/etc/supervisor.conf"]
