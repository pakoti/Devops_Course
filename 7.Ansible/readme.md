# Ansible


Inventory
Module 
Task
playbook
variable
role


    yum:
        name: nginx
        state: present

    servce:
        name: nginx
        state: started


install nginx
install php-fpm
install mysql
configure nginx
configure mysql
restore database

# How to install ansible

    yum -y install python3-virtualenv
    virtualenv venv-01
    source bin/activate
    pip-3.6 install --upgrade pip
    pip-3.6 install ansible


ansible.cfg

[defaults]
inventory = hosts.yaml
host_key_checking = False
remote_user = amin
become = True
log_path = /home/ansible/virtual-env/logs/ansible.log

hosts.yaml

webservers:
 hosts:
  OF1-T-2:



# Ansible Config File 

1. ANSIBLE_CONFIG
2. ansible.cfg
3. ~/.ansible.cfg
4. /etc/ansible/ansible.cfg


ansible-config list
ansible-config view

# How to set passwordless authentication

    ssh-keygen
    ssh-copy-id root@192.168.63.48

    ansible all -m ping 
    ansible all -m command -a 'sleep 10000'
    ansible all -m setup
    ansible all -m yum -a 'name=nginx state=present'
    ansible-doc yum


    YAML

# Install WebServer using playbook

example_key_01: example_value_01
   image: nginx:v1
   container_name: webapp

list_example:
 - value1
 - value2 
 - value3

ports:
 - 80:80
 - 443:443

volumes:
 - data:/data
 - config:/config




example_key_01: example_value_01
example_key_02: example_value_02


{'example_key_01': 'example_value_01' , 'example_key_02': 'example_value_02'}
{'example_list_01':["value1","value2","value3"] , 'example_list_02':["value1","value2","value3"]}



-1. Install nginx
-2. Copy nginx config file
-3. Copy nginx content file
-4. start nginx service
-5. Configure iptables firewall
-6. disable selinux
-7. set ssl certificate


[defaults]
inventory = hosts.yaml
deprecation_warnings = False
host_key_checking = False
remote_user = root


webservers:
 hosts:
  OF1-T-2:


# Sample playbook

- name: install and configure my webserver
  hosts: webservers
  vars:
   key_file: /etc/nginx/ssl/private.key
   cert_file: /etc/nginx/ssl/public.crt
   conf_file: /etc/nginx/conf.d/default.conf
   server_name: www.ali.com
   port_number: 443
  tasks:
    - name: install nginx
      yum:
       name: nginx
       enablerepo: nginx-stable
       state: present

    - name: copy nginx config file
      file:
       state: directory
       path: /etc/nginx/ssl

    - name: copy nginx private key
      copy:
       src: files/private.key
       dest: "{{ key_file }}"

    - name: copy nginx public key
      copy:
       src: files/public.crt
       dest: "{{ cert_file }}"

    - name: copy nginx config file
      template:
       src: files/default.j2
       dest: /etc/nginx/conf.d/default.conf

    - name: copy nginx content file
      copy:
       src: files/index.html
       dest: /usr/share/nginx/html/index.html

    - name: start nginx service
      service:
       name: nginx
       enabled: yes
       state: restarted

    - name: ACCEPT Iptables
      iptables:
       destination_port: 443
       protocol: tcp
       comment: nginx access rule
       chain: INPUT
       jump: ACCEPT

    - name: disable selinux
      command: setenforce 0


sample j2

server {
        listen {{ port_number }} ssl;
        ssl_certificate {{ cert_file }};
        ssl_certificate_key {{ key_file }};
        root /usr/share/nginx/html;
        index index.html index.htm;
        server_name {{ server_name }};


-Jinja2 Templates
-Variables
-Register Variables
-Handler
-External Variables (Var_files)
------------------
https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_variables.html


- name: install and configure my webserver
  hosts: webservers
  vars_files:
    - vars/external_variables.yaml
  tasks:
    - name: install nginx
      yum:
       name: nginx
       enablerepo: nginx-stable
       state: present

    - name: copy nginx config file
      file:
       state: directory
       path: /etc/nginx/ssl

    - name: copy nginx private key
      copy:
       src: files/private.key
       dest: "{{ key_file }}"

    - name: copy nginx public key
      copy:
       src: files/public.crt
       dest: "{{ cert_file }}"

    - name: copy nginx config file
      template:
       src: files/default.j2
       dest: /etc/nginx/conf.d/default.conf

    - name: copy nginx content file
      copy:
       src: files/index.html
       dest: /usr/share/nginx/html/index.html
    - name: start nginx service
      service:
       name: nginx
       enabled: yes
       state: restarted

    - name: ACCEPT Iptables
      iptables:
       destination_port: "{{ port_number }}"
       protocol: "{{ protocol }}"
       comment: nginx access rule
       chain: INPUT
       jump: ACCEPT

    - name: disable selinux
      command: setenforce 0



Playbook
-----------
- name: install and configure my webserver
  hosts: webservers
  vars_files:
    - vars/external_variables.yaml
  tasks:
    - name: install nginx
      yum:
       name: nginx
       enablerepo: nginx-stable
       state: present

    - name: copy nginx config file
      file:
       state: directory
       path: /etc/nginx/ssl

    - name: copy nginx private key
      copy:
       src: files/private.key
       dest: "{{ key_file }}"

    - name: copy nginx public key
      copy:
       src: files/public.crt
       dest: "{{ cert_file }}"

    - name: copy nginx config file
      template:
       src: files/default.j2
       dest: /etc/nginx/conf.d/default.conf
      notify:
       - nginx restart

    - name: copy nginx content file
      copy:
       src: files/index.html
       dest: /usr/share/nginx/html/index.html
      notify:
       - nginx restart

    - name: ACCEPT Iptables
      iptables:
       destination_port: "{{ port_number }}"
       protocol: "{{ protocol }}"
       comment: nginx access rule
       chain: INPUT
       jump: ACCEPT

    - name: disable selinux
      command: setenforce 0

  handlers:
   - name: nginx restart
     service:
      name: nginx
      state: restarted




Jinja2 Templates
----------------
{{ Variable }} ---> Variable definition
{% ....... %} ----> Statement definition
{# ....... #} ----> Comment definition


Register Variable
-------------------
- name: Ansible Register Variable
  hosts: webservers
  tasks:
    - name: whoami task
      command: whoami
      register: name

    - name: show name variable
      debug:
       var: name.stdout



Var Prompt
------------
- name: ansible prompt variables
  hosts: webservers
  vars_prompt:
   - name: username
   - name: password
  tasks:
    - name: show username
      debug:
       msg: "{{ username }}"

    - name: show password
      debug:
       msg: "{{ password }}"


when
ansible inventory
Local facts
=================


when example
-------------
- name: when example
  hosts: webservers
  tasks:


   - name: install nginx on AlmaLinux
     yum:
      name: nginx
      state: present
     when: ansible_distribution == "AlmaLinux"

   - name: Install nginx on ubuntu
     apt:
      name: nginx
      state: present
     when: ansible_distribution == "Ubuntu"


Sample when
---------------
- name: when example
  hosts: webservers
  tasks:

   - name: install nginx on AlmaLinux
     yum:
      name: nginx
      state: present
     when: ( ansible_os_family == "RedHat" and  ansible_distribution_major_version | int >=9 )


ansible-inventory --graph


AD1
DNS2
DHCP1
FileServer1
Payment1


CAN001VW005 ---> FileServer


CAN001VW[001:050]

-HTTP Concepts
-NGINX
-Linux
-Docker
-----------> 60 H
Ansible ---> 30 H
=========================
Git ---> 5H
GitLab > 20 H

-Local facts
-loop
Block
-------------------------

Local facts:

{"date":"Tue Jul 25 09:53:45 EDT 2023"}



/etc/ansible/facts.d/getdate.fact

getdate.fact
-------------
#!/bin/bash

echo {\"date\":\"`date`\"}


- name: running local facts
  hosts: webservers
  tasks:
    - name: create facts.d folder on all servers
      file:
       path: /etc/ansible/facts.d/
       state: directory

    - name: copy fact file on all servers
      copy:
       src: facts.d/getdate.fact
       dest: /etc/ansible/facts.d/getdate.fact
       owner: root
       group: root
       mode: u+rwx,g+rwx,o+rwx

    - name: using setup module
      setup:
       filter: ansible_local

    - name: show date variable on all hosts
      debug:
       msg: date is {{ ansible_local.getdate.date }}

Sample facts
-----------------
- name: running local facts
  hosts: webservers
  tasks:
    - name: create facts.d folder on all servers
      file:
       path: /etc/ansible/facts.d/
       state: directory

    - name: copy fact file on all servers
      copy:
       src: facts.d/nginx.fact
       dest: /etc/ansible/facts.d/nginx.fact
       owner: root
       group: root
       mode: u+rwx,g+rwx,o+rwx

    - name: using setup module
      setup:
       filter: ansible_local

    - name: kill nginx process on all hosts
      shell: kill -9 {{ ansible_local.nginx.pid }}

-----------
#!/bin/bash

echo {\"pid\":\"`ps -aux | grep nginx | grep -v grep | grep master | awk '{print $2}'`\"}





Loop:
----------
- name: yum loop
  hosts: webservers
  tasks:
   - name: create multiple user
     user:
      name: "{{ item.key }}"
      comment: "{{ item.value.comment }}"
      shell: "{{ item.value.shell }}"
     with_dict:
      amin:
       comment: "This is admin user"
       shell: "/bin/bash"
      svc:
       comment: "This is service account"
       shell: "/sbin/nologin"
      ebrahim:
       comment: "This is service account"
       shell: "/sbin/nologin"


   - name: create users home directory
     file:
      dest: "/home/{{ item.0 }}/{{ item.1 }}"
      group: "{{ item.0 }}"
      owner: "{{ item.0 }}"
      state: directory
     with_nested:
       - [amin, ebrahim, svc ]
       - [Documents, Music, Photos]

-Block
  Exception Handling
-Ansible Vault
Async poll
---------------

- name: check nginx installation
  hosts: webservers
  tasks:
   - name: install nginx
     block:
      - name: install nginx package
        yum:
         name: nginx
         state: present
      - name: check nginx installation
        command: nginx -v
     rescue:
      - name: remove nginx
        yum:
         name: nginx
         state: absent
     always:
       - name: debug result
         debug:
           msg: nginx installation completed!!
---------------------

1. install vsftpd
2. set bellow parameters (/etc/vsftpd/vsftpd.conf)

   -->  anonymous_enable: yes
	local_enable: yes
	write_enable: yes
	anon_upload_enable: yes

3. Error ----> roll back to old config

4. restart vsftpd 



# Ansible Vault
---------------
ansible-vault create vault_example_01.yaml
ansible-playbook --ask-vault-password vault_example_01.yaml
ansible-vault edit vault_example_01.yaml
ansible-vault view vault_example_01.yaml
ansible-vault decrypt vault_example_01.yaml
ansible-vault encrypt --vault-id class@prompt block_example_04.yaml
ansible-vault decrypt --vault-id class@prompt block_example_04.yaml
ansible-vault encrypt --vault-id class@pass block_example_04.yaml
ansible-vault rekey vault_example_01.yaml
ansible-playbook --vault-id class@prompt --vault-id username@class block_example_03.yaml
ansible-vault encrypt_string --vault-id class@prompt --name 'password' 'Aa111111'

# Async poll
Ansible on Windows
==================

echo '$ANSIBLE_VAULT;1.2;AES256;class
39303466656634343730643836373831373838306162383030353961656231366664646530323234
6336306361326561663830626664623435336166626535340a383536616162646639623236343531
62333931613633303234353030383564653266633164643131663937303132643036306466333835
6338313464613564340a623732346661633462343562373438323838316366386162333362393338
3432' | ansible-vault decrypt







Async poll
-----------

async_status
 jid:

until

- name: Show sync tasks
  hosts: webservers
  tasks:
   - name: Task Number 1
     command: /bin/sleeeeep 1
     async: 45
     poll: 0
     register: sleep1

   - name: Task Number 2
     command: /bin/sleep 3
     async: 45
     poll: 0
     register: sleep2

   - name: Task Number 3
     command: /bin/sleep 4
     async: 45
     poll: 0
     register: sleep3

   - name: Task Number 4
     command: /bin/sleep 15

   - name: check async task status
     debug:
       msg: "{{ item }}"
     with_items:
      - "{{ sleep1 }}"
      - "{{ sleep2 }}"
      - "{{ sleep3 }}"



async_status
---------------
- name: Show sync tasks
  hosts: webservers
  vars:
   packages:
    - nginx
    - mariadb-server
    - php-fpm
    - vim-common
    - vim-enhanced
  tasks:
   - name: install all packages
     yum:
      name: "{{ packages }}"
     async: 1000
     poll: 0
     register: yum_result

   - name: check task status
     async_status:
      jid: "{{ yum_result.ansible_job_id }}"
     register: job_result
     until: job_result.finished
     retries: 30





1. run ansible.ps1 on windows target
2. pip-3.6 install pywinrm
3.    vars:
    ansible_user: administrator
    ansible_password: P@ssword
    ansible_port: 5986
    ansible_connection: winrm
    ansible_winrm_server_cert_validation: ignore
4. ansible winservers -m win_ping



# Task Delegation

Ansible
 delegation
 tags
 include/import
 role

Git


Magic Variables:
https://docs.ansible.com/ansible/latest/reference_appendices/special_variables.html


- name: task delegation example
  hosts: webservers
  tasks:
   - name: set server hostname
     shell: echo {{ ansible_default_ipv4.address }} {{ ansible_hostname }} >> /etc/hosts
     delegate_to: "{{ item }}"
     with_items: "{{ play_hosts }}"


Practice ?

uri




- name: configure nginx
  hosts: webservers
  tasks:
   - name: install nginx
     yum:
      name: nginx
      state: present
     tags:
      - nginx installation

   - name: update nginx content
     copy:
      src: files/index.html
      dest: /usr/share/nginx/html
     tags:
      - nginx update


   - name: restart nginx service
     service:
      name: nginx
      state: restarted
     tags:
      - nginx update





