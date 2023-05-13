<h1>How to run application server on tomcat behind a nginx server(NGINX as reverse proxy):</h1>
<ul>
<li>1.Download,install Tomcat from Its packages.</li>
<li>2.Download a simple .war file.</li>
<li>3. ... </li>
</ul>


<h1>How to run application server on tomcat behind a nginx server:</h1>
<ul>
<li>1.make a directory :

    mkdir /Tomcat/

</li>
<li>2/1.downloading the proper packages:

    wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.74/bin/apache-tomcat-9.0.74.tar.gz

</li>
<li>2/2.or you can try this:

    curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.74/bin/apache-tomcat-9.0.74.tar.gz

</li>
<p>in /Tomcat/ directory you should un-tar the package and install it.</p>
<li>4.untar the package:

    tar -zxvf  https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.74/bin/apache-tomcat-9.0.74.tar.gz

</li>
<li>5.Remove the Package:

    rm -rf apache-tomcat-9.0.74.tar.gz/

</li>
<p>to run  an application you should only put it in /webapp directory.</p>
</ul>

<h1>How to run a simple .war file:</h1>
<ul>
<p>Download and extract this file in /webapp/ directory.</p>
<li>1.download sample file:

    curl -O https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war

</li>
<li>2.to run this simple.war file we should have JRE_HOME or JAVA_HOME so in order to check whether we have them or not:

        yum list jdk

        yum search jdk

</li>
<li>3.the right package to install is:

    yum -y install java-1.8.0-openjdk.x86_64

</li>

<p>what are differences of JDK and JRE?</p>

<li>4.to check what port our Tomcat is listening to:

    yum -y install net-tools

</li>
<li>5.to check which port are listening to:

    netstat -ntlp

</li>
<li>6.to see SELINUX status:

    getenforce

</li>

<li>7.And also to check to port tomcat is running:

    cat /Tomcat/conf/server.xml

</li>
<p>if we want to open our website with context root it should be in in /Tomact/ with *.war name.also i should note that nginx as reverse proxy has not root and index in its configuration file.</p>
<li>7.edit  our pakotinews.ir configuration file in nginx:
 
    vim /etc/nginx/conf.d/pakotinews.conf

.</li>
<li>8.edit the configuration file like this:

    location /{
        proxy_pass http://192.168.x.x:8080/sample/;
    }

</li>
<li>9.and if you want to change the configuration of SELINUX:

    vim /etc/selinux/config

</li>
<p>if you change SELINUX=PERMISIVE its only monitor and does nothing.<p>
</ul>
