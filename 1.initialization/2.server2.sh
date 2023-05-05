echo [+]Script need tobe root
hostnamectl set-hostname server2
passwd 
yum update  -y & yum upgrade -y 
yum autoremove -y
yum install nginx -y
yum install vim -y
yum -y install vim-common vim-enhanced bash-completion
