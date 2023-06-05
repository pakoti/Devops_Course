# Caching only name server
How to Configure Caching Only Name server?edit the <code>/etc/named.conf</code>:

    recursion yes;
    allow-query-cache { localhost; any; }; 

# How to dump bind cache?

    rndc dumpdb -cache