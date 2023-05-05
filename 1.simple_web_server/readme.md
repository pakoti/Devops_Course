<h1>Fist Task</h1>
<p>this script is for new images or instances.it makes the new environment ready without typing and waiting so much.this scripts are written in alma linux.</p>
<ul>
<li>1.creating instaces in cloud</li>
<li>2.make images ready by updating them</li>
<li>3.installing packages</li>
<li>4.give them internal ip address</li>
<li>5.give them a name</li>
<li>6.adding a local repo to servers</li>
<li>7.Start nginx</li>
<li>8.check and disable firewalls for only this time</li>
<li>9.disabling firewalld</li>
<li>10.changing default page of nginx</li>
</ul>

<h1>how to set internal ip address:</h1>
<ul>
<li>
vim /etc/sysconfig/network-scripts/ifcfg-enp0s3
</li>
<li> add this to the file:
BOOTPROTO=YES
IPADDR=192.168.X.X
MASK=255.255.255.0
GATEWAY=192.168.1.1
DNS1=1.1.1.1
DNS2=8.8.8.8
ONBOOT=YES
</li>
<li>for saving it:syste,ctl restart NetworkManager</li>
</ul>

<h1>how to give servers a name:</h1>
<ul>
<li>
hostnamectl set-hostname {whatever}
</li>
</ul>

<h1>how to add adding a local repo to servers:</h1>
<ul>
<li> Install the prerequisites:

    sudo yum install yum-utils
</li>

<li>
To set up the yum repository, create the file named /etc/yum.repos.d/nginx.repo with the following contents:

    [nginx-stable]
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
    module_hotfixes=true   
</li>
</ul>

<h1>how to start web server:</h1>
<ul>
<li>
start the web server:

systemctl start nginx
</li>
<li>
check for firewall rules:

iptables -nL
</li>
<li>
flush the existing rules:

iptables -F
</li>
<li>
disabling firewall rules:

systemctl disable --now firewalld
</li>
</ul>
