<?php

if (count($argv) < 2) {
    echo "请指定qtunnel地址\n";
    exit(1);
}

$cmd = array_pop($argv);

if (!file_exists($cmd)) {
    echo "{$cmd}不存在\n";
    exit(1);
}

define('__REMOTE_SECRET__', '87zongcai');
define('__CMD__', $cmd . ' -backend=%s -listen=:%d -secret=%s -clientmode=true');

$ports = [
    '119.254.211.239:3001'  =>  3306,   // mysql
    '119.254.211.239:3003'  =>  8383,   // xs-index
    '119.254.211.239:3004'  =>  8384,   // xs-search
    '119.254.211.239:3006'  =>  27017,  // mongodb
    '119.254.110.238:8001'  =>  8001,   // beta-http
    '119.254.110.238:8002'  =>  8002,   // beta-zend-http
    '119.254.110.238:8003'  =>  8003,   // beta-zend-https
];

foreach ($ports as $k => $v) {
    system('nohup ' . sprintf(__CMD__, $k, $v, __REMOTE_SECRET__) . ' >/dev/null 2>&1 &');
    echo "打开端口映射 127.0.0.1:{$v} ==> {$k}\n";
}

