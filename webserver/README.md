## Webserver

A nginx with php-fpm5 web server.

### Build

```
cd /Dockerfile/path
docker build -t webserver ./
```

### Usage 

```
cd /your/work/path/
docker run -d --name web1 -v `pwd`:/var/www:rw -p 4567:80 -p 8000:8000 webserver
```