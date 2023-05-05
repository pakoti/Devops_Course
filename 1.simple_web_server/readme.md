<h1>Fist Task</h1>
<p>this script is for new images or instances.it makes the new environment ready without typing and waiting so much.</p>
<ul>
<li>1.creating instaces in cloud</li>
<li>2.make images ready by updating them</li>
<li>3.installing packages</li>
<li>4.give them internal ip address</li>
<li>5.give them a name</li>
<li>6.adding a local repo to servers</li>
</ul>

<h1>how to set internal ip address:</h1>
<ul>
<li>vim /etc/sysconfig/network-scripts/ifcfg-enp0s3</li>
<li>BOOTPROTO=YES/IPADDR=192.168.X.X/MASK=255.255.255.0/GATEWAY=192.168.1.1/DNS1=1.1.1.1/DNS2=8.8.8.8/ONBOOT=YES</li>
<li>for saving it:syste,ctl restart NetworkManager</li>
</ul>

<h1>how to give servers a name:</h1>
<ul>
<li>hostnamectl set-hostname <whatever></li>
</ul>

<h1>how to add adding a local repo to servers:</h1>
<ul>
<li></li>
</ul>