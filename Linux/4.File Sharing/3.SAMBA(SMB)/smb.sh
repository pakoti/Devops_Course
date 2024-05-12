#configuring smb on linux server

#!/bin/bash
echo ===================================================================================================================
echo [+]Script need tobe root
echo ===================================================================================================================

    yum -y install samba samba-client
    mkdir /SMB-Share
    groupadd smbshare
    usermod -aG smbshare amin
    chgrp smbshare /SMB-Share
    smbpasswd -a amin
    smbpasswd -e amin

echo ===================================================================================================================
echo [+] smb is ready just edit /etc/samba/smb.conf file and put

echo    [sharefolder]
            path = /SMB-Share
            browsable = Yes
            read only = No
            force create mode = 0660
            force directory mode = 2770
            valid users = @smbshare

echo ===================================================================================================================