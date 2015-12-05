## Tronado

Tornado develop enviroment!

### Build

```
cd /Dockerfile/path
docker build -t tornado ./
```

### Usage

first step
```
cd /your/work/path/
vim main.py
```
second step
```python
import tornado.ioloop
import tornado.web

class MainHandler(tornado.web.RequestHandler):
  def get(self):
    self.write("Hellso, sworwld")

if __name__ == "__main__":
  settings = {
    "debug": True,
  }

  app = tornado.web.Application([
      (r"/", MainHandler),
  ], **settings)
  app.listen(80)

  tornado.ioloop.IOLoop.current().start()

```
third step

```
docker run -d --name family -v `pwd`:/working:rw -p 8888:80 tornado
```

forth step

```
chrome: http://192.168.59.103:8888
```

### Test

```
docker exec -t -i family /bin/bash
```