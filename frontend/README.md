## Webserver

A nginx web server.

### Build

```
cd /Dockerfile/path
docker build -t webserver ./
```

### Usage 

```
cd /your/work/path/
docker run -d --name frontend1 -v `pwd`:/var/www:rw -p 4567:80 webserver
```