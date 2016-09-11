## php server

A nginx && php7.0 server with mongodb, redis, mysql, memcached extensions.

### Build

```
cd /Dockerfile/path
docker build -t backend ./
```

### Usage 

** Should link a frontend container with alias static.**

```
cd /your/work/path/
docker run -d --name backend1 --link frontend1:static  -v `pwd`:/working:rw backend
```