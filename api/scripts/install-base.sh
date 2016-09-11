sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
apt-get update
apt-get -y upgrade
apt-get install -y autoconf wget vim build-essential git curl
apt-get install -y libcurl4-openssl-dev pkg-config