# Nginx as Load-Balancer
in this section you will learn how to configure nginx as a load-balancer.in this scenario we have two tomcat servers and one nginx.nginx will play the role of load-balancer and reverse proxy. 

<ul>
<li>1.Bring up to tomcat servers 

    cd /Tomcat/bin

    ./shutdown.sh

    ./startup.sh

</li>
<li>2.configure upstream proxy in nginx:

    vim /etc/nginx/conf.d/pakotinews.conf

</li>
<li>3.add this to the pakotinews.conf:

    upstream backend {

        server 192.168.63.47:8080;
        server 192.168.63.3:8080;

    }

</li>
<li>4.to check syntax:

    nginx -t

</li>
<li>5.to restart system
   
    systemctl restart nginx

</li>
</ul>

