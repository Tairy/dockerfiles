## Webserver

A nginx with php-fpm5 web server.

### Build

```
cd /Dockerfile/path
docker build -t webserver ./
```

### Run 

```
cd /your/work/path/
docker run -d --name sss -v `pwd`:/var/www:rw -p 4567:80 webserver
```