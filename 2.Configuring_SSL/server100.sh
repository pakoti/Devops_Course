#this server will play the web server role in our task
#root paqsswords will be deleted in near future
#!/bin/bash
echo ===================================================================================================================
echo [+]Script need tobe root
echo ===================================================================================================================
mkdir /etc/nginx/ssl
cd /etc/nginx/ssl
openssl genrsa -des3 -out server.key 2048
openssl rsa -in server.key -out private.key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out public.crt
rm -rf server.key
cd ..

mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.bak
echo "server {
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
}" > /etc/nginx/conf.d/pakotinews.conf

nginx -t 
systemctl resart nginx

