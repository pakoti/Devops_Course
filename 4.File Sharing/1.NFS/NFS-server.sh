#NFS server
#!/bin/bash
echo ===================================================================================================================
echo [+]Script need tobe root
echo ===================================================================================================================

yum -y install nfs-utils
systemctl start nfs-server
systemctl start rpcbind
systemctl start nfs-lock ---> RHEL 7
mkdir /NFS-Share



echo ===================================================================================================================
echo [+] NFS Server Is Ready! 
echo ===================================================================================================================