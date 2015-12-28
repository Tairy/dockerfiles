## Redis

Beacuse of GFW, You should download redis first from 
http://download.redis.io/redis-stable.tar.gz

### Build

```
cd /your/dockerfile/path
docker build -t redis ./
```

### Run

```
cd /your/work/path/
docker run -d --name redis1 -v `pwd`:/data:rw -p 8001:6379 redis
```