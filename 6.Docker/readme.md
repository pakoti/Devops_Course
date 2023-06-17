# Docker
Docker is a set of platform as a service (PaaS) products that use OS-level virtualization to deliver software in packages called container.



# Installation
if you want install it on Red-Hat Based linux just run <code>install.sh</code> .


# what is NameSpace? 
Namespaces are a feature of the Linux kernel that partitions kernel resources such that one set of processes sees one set of resources and another set of processes sees a different set of resources. The feature works by having the same namespace for a group of resources and processes, but those namespaces refer to distinct resources.<a href="https://en.wikipedia.org/wiki/Linux_namespaces">[Link]</a>.There are seven common types of namespaces in wide use today. Using the apartment as our guide, let's walk through a summary of what each type does. Below is a brief overview of each namespace type. In subsequent articles, we will show how each namespace works by example.<a href="https://www.redhat.com/sysadmin/7-linux-namespaces">[Link]</a>




<ul>
<li>1.mnt(Mount)
<p>has an independent list of mount points seen by the processes in the namespace. This means that you can mount and unmount filesystems in a mount namespace without affecting the host filesystem.</p>
</li>
<li>2.net(Network interfaces)
<p>has an independent network stack: its own private routing table, set of IP addresses, socket listing, connection tracking table, firewall, and other network‑related resources.</p>
</li>
<li>3.pid(Process isolation)
<p>assigns a set of PIDs to processes that are independent from the set of PIDs in other namespaces. The first process created in a new namespace has PID 1 and child processes are assigned subsequent PIDs. If a child process is created with its own PID namespace, it has PID 1 in that namespace as well as its PID in the parent process’ namespace. See below for an example.</p>
</li>
<li>4.ipc(Interprocess communication)
<p>has its own IPC resources, for example POSIX message queues.</p>
</li>
<li>
5. user namespace:
<p>has its own set of user IDs and group IDs for assignment to processes. In particular, this means that a process can have root privilege within its user namespace without having it in other user namespaces.</p>
</li>
<li>6.UNIX Time‑Sharing (UTS) namespace
<p>allows a single system to appear to have different host and domain names to different processes.</p>
</li>
</ul>
<a href="https://www.nginx.com/blog/what-are-namespaces-cgroups-how-do-they-work/">Resource[Link]</a>


# what is Cgroup?

<a href="https://www.nginx.com/blog/what-are-namespaces-cgroups-how-do-they-work/">Resource[Link] </a>.A control group (cgroup) is a Linux kernel feature that limits, accounts for, and isolates the resource usage (CPU, memory, disk I/O, network, and so on) of a collection of processes.Cgroups provide the following features:
<ul>
<li>Resource limits:

You can configure a cgroup to limit how much of a particular resource (memory or CPU, for example) a process can use.

</li>
<li>Prioritization:

You can control how much of a resource (CPU, disk, or network) a process can use compared to processes in another cgroup when there is resource contention.

</li>
<li>Accounting:

Resource limits are monitored and reported at the cgroup level.

</li>
<li>Control:

You can change the status (frozen, stopped, or restarted) of all processes in a cgroup with a single command.

</li>
</ul>

Cgroups provide the following features:

<p>Resource limits – You can configure a cgroup to limit how much of a particular resource (memory or CPU, for example) a process can use.
Prioritization – You can control how much of a resource (CPU, disk, or network) a process can use compared to processes in another cgroup when there is resource contention.
Accounting – Resource limits are monitored and reported at the cgroup level.
Control – You can change the status (frozen, stopped, or restarted) of all processes in a cgroup with a single command.</p>

<p>So basically you use cgroups to control how much of a given key resource (CPU, memory, network, and disk I/O) can be accessed or used by a process or set of processes. Cgroups are a key component of containers because there are often multiple processes running in a container that you need to control together. In a Kubernetes environment, cgroups can be used to implement resource requests and limits and corresponding QoS classes at the pod level.</p>

# Conclusion (namespace and cgroups)

Namespaces and cgroups are the building blocks for containers and modern applications. Having an understanding of how they work is important as we refactor applications to more modern architectures.Namespaces provide isolation of system resources, and cgroups allow for fine‑grained control and enforcement of limits for those resources.Containers are not the only way that you can use namespaces and cgroups. Namespaces and cgroup interfaces are built into the Linux kernel, which means that other applications can use them to provide separation and resource constraints. 

# How to start first container ?


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



# docker restart policy


<a href="https://docs.docker.com/config/containers/start-containers-automatically/">link</a>
       




# Docker Image


<a href="https://docs.docker.com/storage/storagedriver/">link</a>
       




# Image creation way : 


	1. Dockerfile
	2. Download from dockerhub
	3. commit from running container



# Dockerfile

       FROM python:2.7
       RUN mkdir /app
       WORKDIR /app
       COPY app.py .
       CMD ["python","app.py"]



       FROM alpine:latest
       RUN apk update
       RUN mkdir /app
       CMD ping 8.8.8.8

