## php server

A nginx && php7.0 server with mongodb, redis, mysql, memcached extensions.

### Build

```
cd /Dockerfile/path
docker build -t backend ./
```

### Usage 

```
cd /your/work/path/
docker run -d --name backend1 -v `pwd`:/working:rw backend
```