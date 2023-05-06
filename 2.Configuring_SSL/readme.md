<h1>Configuring SSL on Nginx</h1>
<p>
in this task we install ssl on our previuos web server.we want to install self-signed certificated on our nginx server.
</p>
<ul>
<li>1.make private and public key for ssl certificate</li>
<li>2.configure nginx to use our self-signed ssl certificates</li>
<li>3. ...</li>
<li>4. ...</li>
</ul>




<h1>how to make private and public key for ssl certificate:</h1>
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

    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out public.crt

</li>

<li>5.we should remove server.key because we dont need it:

    rm -rf server.key

</li>
</ul>



<h1>how to configure nginx to use our self-signed ssl certificates:</h1>
<ul>


<li>1.


</li>
<li>1.move our default configuration because we dont want our servers to execute old configurations

    mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.bak

</li>
<p>every nginx has a parent configuration file and it is in /etc/nginx/nginx.conf
</p>
<li>2.write a new configuration file in /etc/nginx/conf.d/pakotinews.conf

    server {
            listen 80;
            server_name www.pakotinews.ir;
            return 301 https://www.pakotinews.ir$request_uri;
    }

    server {
            listen 443 ssl;
            server_name www.pakotinews.ir;
            ssl_certificate /etc/nginx/ssl/public.crt;
            ssl_certificate_key     /etc/nginx/ssl/private.key;
            location / {
                    root /usr/share/nginx/html;
                    index index.html index.htm;
            }
    }

</li>
<li>3.after saving the configuration file you should check for the syntax of it:

    nginx -t 

</li>

<li>4.then restart nginx for applying the changes:

    systemctl resart nginx

</li>

</ul>
