# How to Configure Conditional Forwarder?
edit the <code>/etc/named.conf</code>
    zone "amir.com" {
            type forward;
            forwarders { 192.168.63.3; };
            forward only;
    };
