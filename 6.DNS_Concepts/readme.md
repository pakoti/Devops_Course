# DNS Concepts
<p>in this section we are going to explore dns and its concepts.</p>
<h1>DNS Concepts:</h1>
<ul>
<li>1.if you want to change dns setting in linux just edit this file:

    vim /etc/resolv.conf

</li>
<li>2.open cmd in windows type nslookup and set server:

    server  8.8.8.8

</li>
<li>3.if you want to get type a record just do this:

    set type=a

</li>
<li>4.to get name servers that have authoritative answers you should do :

    set type=ns

</li>
<p>if you get directly from name server that contains domain of website then its called authoritative name servers.in picture-1 this method is so slow and also takes time.</p>

<li>5.caching in DNS is based on TTL (also in ICMP we have TTL but that's different concept).in picture-2 it shows that whenever you change ip(because of security reasons or just changing cloud infrastucture.) of a DNS you should consider checking TTL,because changes will not be effective on name-servers so users on internet may think website is down.
</li>

<li>6.if you but a dedicated bandwidth fron an isp they sell two ip beside the bw.because of reduction of DNS requests (picture-3) </li>

<li>7.if you ask asriran.com name servers varzesh3.com ip its says:Query refused.we should keep in mind that it this wasnt configured on this website then could perform a DDoS attack on this website by just simply configure that nameserver as a DNS server of just some computers.</li>

</ul> 



<h1>Scenario 1</h1> 
<p></p>
<ul>
<li>1.installing bind in our servers:

    yum -y install bind bind-utils

</li>
<li>2.edit the configuration file:

    vim /etc/named.conf

    recursion no;


</li>
<p>we should put no in front of recursion because we dont want others from internet to resolve dns.</p>
<li>3.write a zone in dns configuration:

    zone "amin.com"{
        tyoe master;
        file "/var/named/data/amin.db";
        allow-update{none;};

    };




</li>
<li>4.</li>
<li>5.</li>
<li>6.</li>
</ul>
