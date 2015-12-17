## Elasticsearch

### Build

```
cd /Dockerfile/path
docker build -t elasticsearch ./
```

### Usage 

```
cd /your/work/path/
docker run -d --name search1 -v `pwd`:/data:rw -p 9200:9200 -p 9300:9300 -p 5601:5601 elasticsearch
```

### Test

```
cd /your/work/path/
docker run -d --name search1 -v `pwd`:/data:rw -p 9200:9200 -p 9300:9300 -p 5601:5601 -i -t elasticsearch /bin/bash
# or
docker exec -t -i search1 /bin/bash
```