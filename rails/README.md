## Rails

A rails development env

### Build

```
cd /your/dockerfile/path
docker build -t rails ./
```

### Run

```
cd /your/work/path/
docker run --name sf-hackathon -v `pwd`:/src/hackathon:rw -p 3000:3000 rails
```

### Test

```
docker run -d --name sf-hackathon -i -t rails /bin/bash
docker exec -t -i sf-hackathon /bin/bash
```

### Reference

[Rails on Docker](https://robots.thoughtbot.com/rails-on-docker)