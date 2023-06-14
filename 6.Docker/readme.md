# Docker
Docker is a set of platform as a service (PaaS) products that use OS-level virtualization to deliver software in packages called container



# Installation
if you want install it on Red-Hat Based linux just run <code>install.sh</code> .


# Namespace 
what is namespace and why do we need it?its used for Resource isolation

<ul>
<li>mnt</li>
<li>net</li>
<li>pid</li>
<li>ipc</li>
<li>user</li>
<li>utc</li>
</ul>

How to start first container ?
---------------------------------

docker container run alpine sleep 100000
       image 
       volume
       network

docker container run -d --name webapp sleep 1000
docker container run -d nginx 
docker container ls -a
docker container ls -aq
docker container stop busy_dijkstra
docker container kill flamboyant_ganguly
docker container stop --time 2
docker container rm --force jovial_haibt
docker container inspect webapp



docker container logs -f --tail 20 pingapp
docker container rm --force $(docker container ls -qa)
docker container exec -it sleepapp sh
docker container exec -it --user=amin sleepapp sh
docker container exec -it --workdir=/opt sleepapp sh
docker container exec -it --env class=devops sleepapp sh
docker container inspect sleepapp  -f "{{.NetworkSettings.Networks.bridge.IPAddress}}"
CTRL+P+Q
docker container cp sleepapp:/opt/script.sh .
docker container cp script.sh sleepapp:/opt/
docker container restart sleepapp
docker container stats $(docker container ls -qa)
docker container update sleepapp --restart always
docker container run -d --name pingapp --restart always alpine ping 8.8.8.8
unshare --fork  --pid --mount  --net /bin/sh



docker restart policy
----------------------
https://docs.docker.com/config/containers/start-containers-automatically/




Docker Image
---------------
https://docs.docker.com/storage/storagedriver/




Image creation way : 
--------------------

	1. Dockerfile
	2. Download from dockerhub
	3. commit from running container



Dockerfile
----------
FROM python:2.7
RUN mkdir /app
WORKDIR /app
COPY app.py .
CMD ["python","app.py"]


Dockerfile
------------
FROM alpine:latest
RUN apk update
RUN mkdir /app
CMD ping 8.8.8.8

