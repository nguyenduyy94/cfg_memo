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

<b>REQUIRE: Python3.8+</b>
#### Init a virtual env
```
pip3.8 install virtualenv
python3.8 -m venv venv
```

#### Switch to Virtual Enviroment
```
source venv/bin/activate
activate
```

#### Build UI app
```
npm install
(If get error) npm install --legacy-peer-deps --unsafe-perm=true
npm run build
```

#### Install poppler-utils which is required by pdf2image
sudo apt-get install poppler-utils
(Or CentOS) yum install poppler-utils mesa-libGL
(Or MacOS) brew install poppler


#### Setup AWS env
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

$ aws configure
AWS Access Key ID [None]: <get from https://console.aws.amazon.com/iam/home#/users/moso-doc-ai-server?section=security_credentials>
AWS Secret Access Key [None]: <get from https://console.aws.amazon.com/iam/home#/users/moso-doc-ai-server?section=security_credentials>
Default region name [None]: us-east-2
Default output format [None]: json

```

#### Start Task Queue 
```
# Go to root folder where docker-compose.yml is located, then
docker-compose up -d redis

# In MacOS, always set this env to allow RQ task queue to fork processes
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Start a queue with name 'parsing-tasks'
cd ./server
rq worker parsing-tasks
```

#### Monit
Example for CentOS, source code is located at ```/opt/moso/doc_ai```
```
yum -y install epel-release
yum -y install monit

service monit start

cp /opt/moso/doc_ai/deployment/slack_notification.sh /etc/slack_notification.sh
chmod +x /etc/slack_notification.sh

cp /opt/moso/doc_ai/deployment/doc_ai_monit_prod /etc/monit.d/doc_ai_monit_prod

monit -c /etc/monitrc
monit reload

```

