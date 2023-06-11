# Firewalls
How to configure firewalls in linux.


<ul>
<li>1.Iptables</li>
<li>2.Firewalld</li>
<li>3.NFTables</li>
</ul>
<p>Firewalld is legacy now.</p>


<h3>Table</h3>
<ul>
<li>1.filter</li>
<li>2.nat</li>
<li>3.mangle</li>
</ul>


<p>every firewall in world is statefull or stateless.iptables is stateless and you should write input and output rules.</p>
<p>chains are like this</p>
<ul>
<li>1.prerouting</li>
<li>2.forward</li>
<li>3.input</li>
<li>4.output</li>
<li>5.postrouting</li>
</ul>


# Iptable
here are some rules in iptables

<ul>
<li>by defualt shows all rules in filter chain.to see all rules in iptables:

    iptable -nL

</li>
<li>iptables sample scenario:
<p>To drop all inbound traffic</p>
    iptables -A INPUT -s 192.168.21.1 -j DROP
<p>to track all old connection and drops new connection(its good FOR MAINTing servers),to look for who connected to our servers <code>netstat -tnlp</code>.</p>
    iptables -A INPUT -s 192.168.21.1 -m conntrack --ctstate NEW,ESTABLISHED -j DROP
    iptables -I INPUT 3 -s 192.168.21.1 -m conntrack --ctstate NEW -j DROP


192.168.21.1 ----> Server ---> Ping ---> ACCEPT
</li>
<li>2. 

    iptables -A INPUT -p tcp --dport 22 -s 192.168.21.1 -j ACCEPT
    iptables -A INPUT -j DROP
    iptables -A OUTPUT -p tcp --sport 22 -d 192.168.21.1. -j ACCEPT
    iptables -A OUTPUT -j DROP

</li>
</ul>


<h3>ICMP-Types:</h3>
<ul>
<li>1.echo-request</li>
<li>2.echo-reply</li>
<li>3.mangle</li>
</ul>



