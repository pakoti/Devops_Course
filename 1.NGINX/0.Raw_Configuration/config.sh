#First Configuration
#!/bin/bash
echo ===================================================================================================================
echo [+]Script need tobe root
echo ===================================================================================================================

hostnamectl set-hostname server1
yum -y update 
yum -y upgrade  
yum autoremove -y
yum install nginx -y
yum install vim -y
yum -y install vim-common vim-enhanced bash-completion
yum -y autoclean
echo ===================================================================================================================
echo [+] Instance Is Ready! 
echo ===================================================================================================================