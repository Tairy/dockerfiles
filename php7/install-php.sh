
SF_PHP_VERSION=7.0.0
SF_MEMCACHED_VERSION=1.0.18
SF_CPU=

# install build system
apt-get install -y libxml2-dev libcurl3-dev librecode-dev libjpeg-dev libpng12-dev libsasl2-2 sasl2-bin libsasl2-2 libsasl2-dev libsasl2-modules freetype* libreadline-dev libgearman-dev

# build memcache
wget https://launchpad.net/libmemcached/1.0/${SF_MEMCACHED_VERSION}/+download/libmemcached-${SF_MEMCACHED_VERSION}.tar.gz
tar zxf libmemcached-${SF_MEMCACHED_VERSION}.tar.gz
cd libmemcached-${SF_MEMCACHED_VERSION}
./configure --enable-sasl
make ${SF_CPU} && make install
cd ..
rm -f libmemcached-${SF_MEMCACHED_VERSION}.tar.gz
rm -rf libmemcached-${SF_MEMCACHED_VERSION}

# get latest php version
wget http://cn2.php.net/distributions/php-${SF_PHP_VERSION}.tar.gz
tar zxf php-${SF_PHP_VERSION}.tar.gz
cd php-${SF_PHP_VERSION}
./configure --prefix=/php --with-config-file-path=/php/etc --with-config-file-scan-dir=/php/etc/conf.d --disable-cgi --enable-mysqlnd --with-curl --with-openssl --with-pcre-regex --with-readline --with-recode --with-zlib --enable-fpm --with-fpm-user=www-data --with-fpm-group=www-data --with-pdo-mysql --with-gd --with-jpeg-dir=/usr --with-png-dir=/usr --enable-mbstring --enable-phar=shared --enable-gd-native-ttf --with-freetype-dir=/usr/include/freetype2
make ${SF_CPU} && make install
/php/bin/pecl install redis
yes "" | /php/bin/pecl install mongo
yes "" | /php/bin/pecl install memcached
yes "" | /php/bin/pecl install oauth
yes "" | /php/bin/pecl install gearman

if [ "$SF_DEV" == "yes" ]; then
    echo "install development php configure file"
    cp php.ini-development /php/etc/php.ini
else
    echo "install production php configure file"
    cp php.ini-production /php/etc/php.ini
fi

mv /php/etc/php-fpm.conf.default /php/etc/php-fpm.conf

echo "extension=redis.so" >> /php/etc/php.ini
echo "extension=mongo.so" >> /php/etc/php.ini
echo "extension=memcached.so" >> /php/etc/php.ini
echo "extension=oauth.so" >> /php/etc/php.ini
echo "extension=gearman.so" >> /php/etc/php.ini
echo "date.timezone=Asia/Shanghai" >> /php/etc/php.ini
echo "always_populate_raw_post_data=-1" >> /php/etc/php.ini
echo "session.save_handler=memcached" >> /php/etc/php.ini
echo "session.save_path=127.0.0.1:11211" >> /php/etc/php.ini
echo "rlimit_files = 65535" >> /php/etc/php-fpm.conf
echo "listen.owner = www-data" >> /php/etc/php-fpm.conf
echo "listen.group = www-data" >> /php/etc/php-fpm.conf
sed -i 's/listen = 127.0.0.1:9000/listen = \/var\/run\/php5-fpm.sock/g' /php/etc/php-fpm.conf

cd ..
rm -f php-${SF_PHP_VERSION}.tar.gz
rm -rf php-${SF_PHP_VERSION}

apt-get install -y memcached redis-server
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/redis/redis.conf
sed -i 's/save 900 1/#save 900 1/g' /etc/redis/redis.conf
sed -i 's/save 300 10/#save 300 10/g' /etc/redis/redis.conf
sed -i 's/save 60 10000/#save 60 10000/g' /etc/redis/redis.conf
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/memcached.conf

