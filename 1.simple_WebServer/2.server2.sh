#this server acts like a client in our task
#!/bin/bash
echo ===================================================================================================================
echo [+]Script need tobe root
echo ===================================================================================================================

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
echo ===================================================================================================================
echo [+] Server Updated and Upgraded and successfully is running and can be a client for webserver
echo ===================================================================================================================
