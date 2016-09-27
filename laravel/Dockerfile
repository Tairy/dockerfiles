FROM daocloud.io/ubuntu:14.04
MAINTAINER Tairy <tairyguo@gmail.com>

ADD config/nginx_config /etc/nginx/sites-enabled/default

ADD scripts/install-base.sh /root/install-base.sh
RUN chmod +x /root/install-base.sh
RUN /bin/bash /root/install-base.sh

ADD scripts/install-nginx.sh /root/install-nginx.sh
RUN chmod +x /root/install-nginx.sh
RUN /bin/bash /root/install-nginx.sh

ADD scripts/install-php.sh /root/install-php.sh
RUN chmod +x /root/install-php.sh
RUN /bin/bash /root/install-php.sh

WORKDIR /working

ADD scripts/install-laravel.sh /root/install-laravel.sh
RUN chmod +x /root/install-laravel.sh
RUN /bin/bash /root/install-laravel.sh

ENV PATH=$PATH:/root/.composer/vendor/bin
RUN service php7.0-fpm start

EXPOSE 80

CMD php-fpm7.0 -c /etc/php/7.0/fpm/php-fpm.conf && nginx -g "daemon off;"