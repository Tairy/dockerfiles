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

### Link

```
docker run -d --name haproxy1 --link web3 --link web4 -v `pwd`:/etc/haproxy:rw -p 9999:80 -p 8989:443 haproxy
```


### Test

```
docker exec -t -i haproxy1 /bin/bash
```

### Setting

vim /etc/default/haproxy

```
ENABLED=1
```

### Reference

- [How To Use HAProxy to Set Up HTTP Load Balancing on an Ubuntu VPS](https://www.digitalocean.com/community/tutorials/how-to-use-haproxy-to-set-up-http-load-balancing-on-an-ubuntu-vps)