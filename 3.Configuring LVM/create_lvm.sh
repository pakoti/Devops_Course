#How to create lvm 
#!/bin/bash
echo ===================================================================================================================
echo [+]How to configure LVM
echo ===================================================================================================================


fdisk
pvcreate /dev/sdb2
pvs
vgextend data /dev/sdb2
lvextend -l +255 /dev/data/lvol01
xfs_growfs / resize2fs
df -h


echo ===================================================================================================================
echo [+] LVM is ready!
echo ===================================================================================================================