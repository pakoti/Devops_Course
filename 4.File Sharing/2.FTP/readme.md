# FTP (File Transfer Protocol)
we have two kind of FTP servers:
<ul>
<li>1.Active FTP Mode</li>
<li>2.Passive FTP Mode</li>
</ul>

# Active mode FTP

For any FTP connection, it can operate in active mode or passive mode. Each mode determines how the data connection is established. Active mode FTP was the original method for FTP, and can often be the default mode. To transfer data, a client and a server have to first start a Control Connection. Here, the client and server negotiate the details of the Data Connection prior to opening a connection and transferring data. With active mode, a client makes the initial connection and sends the PORT command, and a server creates a second connection back to the client.


# Passive mode FTP 

Passive mode is the second way an FTP connection can operate. With passive mode FTP, a client connects and sends a PASV command. This command requests a port number to connect to. When the client receives the port, it then starts the second connection and sends the data. Passive mode FTP works well in tandem with firewalls that are configured for port forwarding. Data gets forwarded from the firewall port to the server port, so that outside clients are unable to directly access the server

# How to configure Anonymous FTP Access?
edit <code>/etc/vsftpd/vsftpd.conf</code>:

    vim /etc/vsftpd/vsftpd.conf

<p>and put this there</p>
    anonymous_enable=YES


# How to configure FTP using username and password?
edit <code>/etc/vsftpd/vsftpd.conf</code>:

    vim /etc/vsftpd/vsftpd.conf



    anonymous_enable=NO

    userlist_enable=YES
    userlist_deny=NO
    local_enable=YES
    listen=YES
    listen_ipv6=NO


    How to configure passive ftp ?
----------------------------------
connect_from_port_20=NO
pasv_enable=YES
pasv_max_port=10100
pasv_min_port=10090



# How to jail ftp user ?

    chroot_local_user=YES
    allow_writeable_chroot=YES


