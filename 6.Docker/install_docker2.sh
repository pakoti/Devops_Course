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


#Install from a package

#If you can’t use Docker’s rpm repository to install Docker Engine, you can download the .rpm file for your release and install it manually. 
#You need to download a new file each time you want to upgrade Docker Engine.

#Go to https://download.docker.com/linux/centos/ and choose your version of CentOS. 
#Then browse to x86_64/stable/Packages/ and download the .rpm file for the Docker version you want to install.

#Install Docker Engine, changing the path below to the path where you downloaded the Docker package.
sudo yum install /path/to/package.rpm

#Start Docker.
sudo systemctl start docker
#Verify that the Docker Engine installation is successful by running the hello-world image
sudo docker run hello-world

echo ===================================================================================================================
echo [+] Docker is ready 
echo ===================================================================================================================
