#this server will play the web server role in our task

echo ===================================================================================================================
echo [+]Script need tobe root
hostnamectl set-hostname server1
passwd
yum update  -y & yum upgrade -y 
yum autoremove -y
yum install nginx -y
yum install vim -y
yum -y install vim-common vim-enhanced bash-completion
echo "[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true

[nginx-mainline]
name=nginx mainline repo
baseurl=http://nginx.org/packages/mainline/centos/$releasever/$basearch/
gpgcheck=1
enabled=0
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true" > /etc/yum.repos.d/nginx.repo

systemctl start nginx
iptables -nL
iptables -F
systemctl disable --now firewalld

