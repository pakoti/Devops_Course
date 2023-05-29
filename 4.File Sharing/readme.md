# File sharing


<ul>
<li>1.NFS</li>
<li>2.FTP</li>
<li>3.CIFS -->SAMBA(SMB)</li>
</ul>

# NFS (Network File System)

<ul>
<li>1.On NFS Server: 
    yum -y install nfs-utils
    systemctl start nfs-server
    systemctl start rpcbind
    
    mkdir /NFS-Share
    putt bellow line in "/etc/exports"
    /NFS-Share	192.168.63.47(rw,sync,no_root_squash,no_all_squash)

<p>if you are working with redhat linux you should use this command for starting rpcbind</p>

    systemctl start nfs-lock

</li>

<li>On NFS Client:

    yum -y install nfs-utils
    systemctl start nfs-server
    mkdir /DATA
    mount -t nfs 192.168.63.47:/NFS-Share  /DATA

</li>

</ul>


# FTP (File Transfer Protocol)
we have two kind of FTP servers:
<ul>
<li>1.Active</li>
<li>2.Passive</li>
</ul>
