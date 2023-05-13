
#!/bin/bash

#run this in nginx side!
#nginx as a reverse proxy
#running tomcat behind a nginx server 


echo ===================================================================================================================
echo [+]Script need tobe root
echo ===================================================================================================================


echo "location /{
        proxy_pass http://192.168.x.x:8080/sample/;
    }" >> /etc/nginx/conf.d/pakotinews.conf


echo ===================================================================================================================
echo [+] nginx-side of reverse proxy successfully launched
echo ===================================================================================================================