# SAMBA(SMB) or CIFS

    yum -y install samba samba-client
    mkdir /SMB-Share
    groupadd smbshare
    usermod -aG smbshare amin
    chgrp smbshare /SMB-Share
    smbpasswd -a amin
    smbpasswd -e amin
    
<p>edit this <code>/etc/samba/smb.conf</code>:</p>

    vim /etc/samba/smb.conf

<p>and write down this configurations:</p>

    [sharefolder]
            path = /SMB-Share
            browsable = Yes
            read only = No
            force create mode = 0660
            force directory mode = 2770
            valid users = @smbshare

