# NFS (Network File System)
nfs is usefull for transfering files in network.on both servers(client and also server) we should install nfs-utils.


<ul>
<li>1.On NFS Server we should install these packages:

    yum -y install nfs-utils
    systemctl start nfs-server
    systemctl start rpcbind

<p>if you are working with redhat linux you should use this command for starting rpcbind</p>
 
    systemctl start nfs-lock

<p>and then make a directory in directory we want to share:</p>

    mkdir /NFS-Share

<p></p>

    putt bellow line in "/etc/exports"
    /NFS-Share	192.168.63.47(rw,sync,no_root_squash,no_all_squash)

</li>

<li>On NFS Client we should install these packages:

    yum -y install nfs-utils
    systemctl start nfs-server

<p>and then make a directory:</p>

    mkdir /DATA

<p>Mount them to where ever we wanted to:</p>

    mount -t nfs 192.168.63.47:/NFS-Share  /DATA

</li>

</ul>