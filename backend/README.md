## php server

A nginx && php7.0 server with mongodb, redis, mysql, memcached extensions.

### Build

```
cd /Dockerfile/path
docker build -t backend ./
```

### Usage 

** Should link a frontend container with alias static.**

[Here](https://github.com/Tairy/dockerfiles/tree/master/api) is a php server do not need to link.

```
cd /your/work/path/
docker run -d --name backend1 --link frontend1:static  -v `pwd`:/working:rw backend
```