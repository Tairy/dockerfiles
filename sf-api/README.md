### 前端容器链接

link 一个别名叫 static 的前端容器即可。

### Usage 

```
cd /your/work/path/
docker run -d --name sf-web1 --link sf-frontend1:static  -v `pwd`:/working:rw -p 4562:80 sf-web
```