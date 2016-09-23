apt-get install -y python-software-properties software-properties-common
add-apt-repository -y ppa:ondrej/php
apt-get update --fix-missing
apt-get -y --force-yes install php7.0-dev \
    php7.0-mysql php7.0-fpm php7.0-gd php7.0-curl \
    php-imagick php7.0-mcrypt php7.0-mbstring \
    php7.0-memcached php7.0-xml php7.0-json php7.0-cli\
    php7.0-mcrypt