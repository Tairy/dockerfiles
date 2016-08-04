sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
apt-get update
apt-get -y upgrade
apt-get install -y autoconf make wget vim build-essential git curl
