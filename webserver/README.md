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

### Custom

如果只需要 webserver, 将 `config/default_site` 和 `Dockerfile` 关于 php 的安装的部分删除即可。