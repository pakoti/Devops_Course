# BIND Hardening

BIND Hardening

<ul>
<li>1. Update BIND version</li>

<li>2. hide BIND version

  dig @192.168.63.47 chaos version.bind txt

Set bellow option

    version   "null"; 
    
or whatever you like to put.

</li>
<li>3. Run only BIND</li>

<ul>


    acl amin-zone {

            192.168.21.2;
            localhost;
    };

    allow-query {amin-zone; };