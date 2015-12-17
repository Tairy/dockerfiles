## config

```
cd /etc/mysql/my.cnf

set bind-address = 0.0.0.0

mysql config:

CREATE USER 'root'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
```