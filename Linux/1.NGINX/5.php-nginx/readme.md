# configuring php behind nginx
in this configuration both nginx and php are in same server.
<ul>
<li>1.installing php runtime 

    yum -y install php-fpm.x86_64</li>

<li>2/1.we should edit nginx configuration files:

    vim /etc/nginx/conf.d/php.conf

</li>
<li>2/2.the configuration is like this:

    server {
    listen      80;
    listen [::]:80;
    index index.php index.html;
    server_name localhost;
    root /usr/share/nginx/html;

    sendfile           on;
    tcp_nopush         on;
    tcp_nodelay        on;
    keepalive_timeout  15;

    gzip  on;
    gzip_disable msie6;
    gzip_static on;
    gzip_types text/plain text/css application/x-javascript text/xml application/xml+rss text/javascript;
    gzip_vary on;

    location / {
        if (!-e $request_filename) {
                rewrite ^(.+)$ /$1.php last;
         }
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;

        fastcgi_pass 127.0.0.1:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
    }

<p>this means whatever ends in .php should go this server,and php engine listens on 9000 port.</p>
</li>
<li>3.we should restart php:

    systemctl start php-fpm

</li>
<li>4.to check if it is working:

    netstat -ntlpu

</li>
<li>5.to put php sample code 

    vim /usr/nginx/share/nginx/html/index.php
    
<p>to get php sample code https://www.php.net/manual/en/function.phpinfo.php</p>
</li>
<li>6/1.add this to php configuration file:

    vim /etc/php-fpm.d/www.conf

<p>in this file you can configure php to listen a file or just and ip and port.";"this a comment in php language.</p>

</li>
<li>6/2.add this to configuration file:

    listen = 127.0.0.0:9000

</li>
<li>7.to check if we dont have any problems in our syntax:

    nginx -t

</li>
<li>8.we should restart nginx:

    systemctl restart nginx

</li>


</ul>