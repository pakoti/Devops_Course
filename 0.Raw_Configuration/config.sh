#First Configuration
#!/bin/bash
echo ===================================================================================================================
echo [+]Script need tobe root
echo ===================================================================================================================

hostnamectl set-hostname server1
yum update  -y & yum upgrade -y 
yum autoremove -y
yum install nginx -y
yum install vim -y
yum -y install vim-common vim-enhanced bash-completion