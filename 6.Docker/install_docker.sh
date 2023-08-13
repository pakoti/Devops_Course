# how to install docker in linux cent os
#!/bin/bash
echo ===================================================================================================================
echo [+]Script need tobe root
echo ===================================================================================================================

#remove old versions
sudo yum remove docker \
                docker-client \
                docker-client-latest \
                docker-common \
                docker-latest \
                docker-latest-logrotate \
                docker-logrotate \
                docker-engine


#Install using the rpm repository

#Set up the repository
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

#Install Docker Engine ,Install Docker Engine, containerd, and Docker Compose:
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#Start Docker.
sudo systemctl start docker
#Verify that the Docker Engine installation is successful by running the hello-world image
sudo docker run hello-world

echo ===================================================================================================================
echo [+] Docker is ready 
echo ===================================================================================================================
