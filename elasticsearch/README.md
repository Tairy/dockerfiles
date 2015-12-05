## Elasticsearch

### Build

```
cd /Dockerfile/path
docker build -t elasticsearch ./
```

### Usage 

```
cd /your/work/path/
docker run -d --name search1 -v `pwd`:/data:rw -p 9200:9200 -p 9300:9300 -i -t elasticsearch /bin/bash
```

### Test

```
docker exec -t -i search1 /bin/bash
```