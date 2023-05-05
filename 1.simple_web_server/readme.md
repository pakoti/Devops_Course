<h1>First Task</h1>
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
<li>11.check logs of our new web server</li>
</ul>

<h1>how to set internal ip address:</h1>
<ul>
<li>edit network adaptor setting:
    
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
<li>to change a webserver name only:
    
    hostnamectl set-hostname server100

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

<h1>How to change default page of nginx:</h1>
<p>default configuration file for nginx in alma linux is in /etc/nginx/nginx.conf .the /etc/nginx/nginx.conf directory is used to store additional configuration files that can be included in main nginx configuration file.</p>
<ul>
<li>for eding nginx configyration file:

    vim /etc/nginx/conf.d/default.conf 

</li>
<li>for editing html files:

    vim /usr/share/nginx/html
</li>
</ul>

<h1>how to check logs for error and accesses:</h1>
<ul>
<li>for checking errors:

    tail -f -n 20 /var/log/nginx/error.log

</li>
<li>for checking access logs:

    tail -f -n 20 /var/log/nginx/access.log

</li>
</ul>