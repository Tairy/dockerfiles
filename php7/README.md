## Docker 开发环境安装

clone这个项目并运行

```
make sf-dev
make run NAME=sf.dev DIR=/path/to/your/working/dir
```

浏览器通过如下地址访问

```
http://your_app_name.testapp.org
```

进入docker命令行

```
docker exec -t -i sf.dev /bin/bash
```
