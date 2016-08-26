apt-get install -y python-software-properties software-properties-common
add-apt-repository -y ppa:ondrej/php
apt-get update --fix-missing
apt-get -y --force-yes install php7.0-dev \
    php7.0-mysql php7.0-fpm php7.0-gd php7.0-curl \
    php-imagick php7.0-mcrypt php7.0-mbstring \
    php7.0-memcached php7.0-xml php7.0-json php7.0-cli\
    php7.0-mcrypt

pecl install mongodb-1.1.8
echo extension=mongodb.so > /etc/php/7.0/mods-available/mongodb.ini
ln -sf /etc/php/7.0/mods-available/mongodb.ini /etc/php/7.0/fpm/conf.d/20-mongodb.ini
ln -sf /etc/php/7.0/mods-available/mongodb.ini /etc/php/7.0/cli/conf.d/20-mongodb.ini
pecl install redis-3.0.0
echo extension=redis.so > /etc/php/7.0/mods-available/redis.ini
ln -sf /etc/php/7.0/mods-available/redis.ini /etc/php/7.0/fpm/conf.d/20-redis.ini
ln -sf /etc/php/7.0/mods-available/redis.ini /etc/php/7.0/cli/conf.d/20-redis.ini