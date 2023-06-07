# How to avoid AXFR attacks in DNS
we write ACL  because we dont want an attacker that has inside access cant find real names of servers(pic1.PNG).we should give names to our ACL.For example amin.com.we should edit <code>/etc/named.conf</code>

    acl amin-zone {

            192.168.21.2;
            localhost;
    };

allow-query {amin-zone; };

with just simple commands you can dump all domains 

    dig amin.com axfr
