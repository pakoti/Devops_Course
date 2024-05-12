# Caching only name server
dont put any kind of zones in such servers.How to Configure Caching Only Name server?edit the <code>/etc/named.conf</code>:

    recursion yes;
    allow-query-cache { localhost; any; }; 

this section is for quering in root hints.and in here <code>/var/named/named.ca</code> all root hints server ips are here. 

    zone "." IN{

    type hint;
    file named.ca;
    };

# How to dump bind cache?

    rndc dumpdb -cache

# How to change TTL?
edit the <code>/var/named/data/amin.db</code>:

    vim /var/named/data/amin.db

# How to look for status in DNS?
run this coomand and in that directory you have <code>named_stats.txt</code>

    rndc stat
