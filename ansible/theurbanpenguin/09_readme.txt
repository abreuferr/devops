#: Title : ansible
#: Author : "Caio Abreu Ferreira" <abreuferr_gmail.com>
#: Description : Deploy Apache Web Server
#: Options : https://www.youtube.com/channel/UCFFLP0dKesrKWccYscdAr9A

$ cat ansible.cfg
    [defaults]
    inventory = /Users/cosmo/myprojects/devops/ansible/theurbanpenguin/inventory
    remote_user = devops
    [privilege_escalation]
    become = true
    become_method = sudo
    become_user = root

$ cat inventory
    [centos]
    192.168.10.20

    [debian]
    192.168.10.21

$ cat apache.yml
---
- name: Deploy Apache
  hosts: centos
  gather_facts: true
  tasks:

    - name: Install Apache
      yum:
        name: 
          - httpd
          - httpd-manual
          - firewalld
        state: latest

    - name: Don't Listen All Interfaces
      lineinfile:
        path: /etc/httpd/conf/httpd.conf
        regexp: '^Listen 80'
        state: absent
    
    - name: Listen Single Interface
      lineinfile:
        path: /etc/httpd/conf/httpd.conf
        insertafter: '^#Listen'
        line: 'Listen {{ ansible_default_ipv4.address }}:80'

    - name: Default Page
      copy:
        dest: /var/www/html/index.html
        content: |
          Welcome to my page
          This is from devops
    
    - name: Start Services
      service:
        name: "{{ item }}"
        state: started
        enabled: true
      loop:
        - httpd
        - firewalld

    - name: Open Firewall
      firewalld:
        service: http
        state: enabled
        permanent: true
        immediate: true
...

$ ansible-playbook apache.yml --syntax-check

$ ansible-playbook apache.yml