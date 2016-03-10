## Kafka

### Build

```
cd /Dockerfile/path
docker build -t kafka ./
```

### Usage

```
cd /your/work/path/
docker run -d --name mongodb1 -v `pwd`:/data:rw -p 4569:27017 mongodb
```


### Test

```
docker exec -t -i mongodb1 /bin/bash
```