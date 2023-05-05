<h1>Second Task</h1>
<p>
in this task we install ssl on our previuos web server.we want to install self-signed certificated on our nginx server.
</p>
<ul>
<li>1.make a ssl directory in /etc/nginx/</li>
<li>2.generate a private key</li>
<li>3.</li>
<li>1.</li>
<li>1.</li>
<li>1.</li>
</li>
</ul>


<h1>how to make a ssl directory in /etc/nginx/:</h1>
<ul>
<li>1.make a directory in /etc/nginx/:

    mkdir /etc/nginx/ssl

</li>


<p>and also how to generate a private and public key:</p>

<li>2.the name of our private secret key is server.key

    openssl genrsa -des3 -out server.key 2048

</li>
<p>you should enter a password here.</p>

<li>3.remove password from server key in order to be readable for nginx:

    openssl rsa -in server.key -out private.key

</li>

<p>remember this is a private you should keep it safe.otherwise hackers can dcyrpt your traffic.</p>

<li>4.make a "self-signed" public key:

    openssl rsa -in server.key -out private.key

</li>

</ul>

<h1></h1>
<ul>
<li>1.</li>
</ul>


<h1></h1>
<ul>
<li>1.</li>
</ul>



<h1></h1>
<ul>
<li>1.</li>
</ul>