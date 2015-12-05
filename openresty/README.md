## Openresty

A openresty web server

### Build

```
cd /your/dockerfile/path
docker build -t openresty ./
```

### Usage

```
cd /your/work/path/
docker run -d --name log1 -v `pwd`:/var/www:rw -p 4568:80 openresty
```