Require CentOS 7+

#### Install Docker
```
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
```

#### Install docker compose
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

#### Install Nginx
```
sudo yum install -y epel-release
sudo yum install -y nginx
```

#### Copy nginx.conf file to /etc/nginx/conf.d/
```
cp ./deployment/etc/nginx/conf.d/[your file].conf /etc/nginx/conf.d/[your file].conf
```

#### Install npm & mvn
```
sudo yum install -y npm
sudo yum install -y maven
```

#### Install postgres client
```
sudo yum install -y postgresql
```

#### Install webmin
```
yum install wget
wget http://prdownloads.sourceforge.net/webadmin/webmin-1.955-1.noarch.rpm
yum -y install perl perl-Net-SSLeay openssl perl-IO-Tty perl-Encode-Detect
rpm -U webmin-1.955-1.noarch.rpm
/usr/libexec/webmin/changepass.pl /etc/webmin root pppppp
```

#### Nginx Nginx issue: to 127.0.0.1:8888 failed (13: Permission denied) while connecting to upstream
```
setsebool -P httpd_can_network_connect 1
```

#### A separated place to deploy UI assets
```
mkdir /var/www/dashboard
```

#### Nginx issue : Permission denied (13) on CentOS
```
chcon -Rt httpd_sys_content_t /var/www/
```


