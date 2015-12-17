
CPU=N
PHP=N
MEMCACHED=N
PROXY=N
NAME=N
DIR=/root
PORT=80

sf-dev:
	cp scripts/install-php.sh .
	if [ "${CPU}" != "N" ]; then sed -ig 's/SF_CPU=/SF_CPU=-j${CPU}/g' install-php.sh; fi
	if [ "${PHP}" != "N" ]; then sed -ig 's/SF_PHP_VERSION=.*/SF_PHP_VERSION=${PHP}/g' install-php.sh; fi
	if [ "${MEMCACHED}" != "N" ]; then sed -ig 's/SF_MEMCACHED_VERSION=.*/SF_MEMCACHED_VERSION=${MEMCACHED}/g' install-php.sh; fi
	if [ "${PROXY}" != "N" ]; then \
		HTTP_PROXY=${PROXY} docker build -t segmentfault/sf.dev -f SF/Dockerfile.dev .; \
	else \
		docker build -t segmentfault:sf.dev-php7 -f SF/Dockerfile.dev .; \
	fi
	rm -f install-php.sh*

run:
	if [ "${NAME}" = "sf.dev" ]; then \
		docker run -d --name sf.dev -v ${DIR}:/www:rw -p 80:80 -p 3306:3306 -p 6379:6379 -p 8383:8383 -p 8384:8384 -p 11211:11211 -p 27017:27017 -p 10081:8002 -p 10082:8003 segmentfault:sf.dev; \
	fi

