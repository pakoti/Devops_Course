#!/bin/bash
#how to run tomcat application server
echo ===================================================================================================================
echo [+]Script need tobe root
echo ===================================================================================================================
mkdir /Tomcat/
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.74/bin/apache-tomcat-9.0.74.tar.gz
curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.74/bin/apache-tomcat-9.0.74.tar.gz
tar -zxvf  https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.74/bin/apache-tomcat-9.0.74.tar.gz
rm -rf apache-tomcat-9.0.74.tar.gz/
curl -O https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war
yum -y install java-1.8.0-openjdk.x86_64
yum -y install net-tools

echo ===================================================================================================================
echo [+] Tomcat-side of reverse-proxy successfully launched
echo ===================================================================================================================