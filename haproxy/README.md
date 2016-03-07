## Haproxy

### Build

```
cd /Dockerfile/path
docker build -t haproxy ./
```

### Usage

```
cd /your/work/path/
docker run -d --name haproxy1 -v `pwd`:/etc/haproxy:rw -p 9999:80 -p 8989:443 haproxy
```


### Test

```
docker exec -t -i haproxy1 /bin/bash
```