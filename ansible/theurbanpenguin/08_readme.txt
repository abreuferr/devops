#: Title : Ansible
#: Author : "Caio Abreu Ferreira" <abreuferr_gmail.com>
#: Description : Ansible User Module
#: Options : https://www.youtube.com/channel/UCFFLP0dKesrKWccYscdAr9A

# ansible configuration file
$ cat ansible.cfg
    [defaults]
    inventory = /Users/cosmo/myprojects/devops/ansible/theurbanpenguin/inventory
    remote_user = devops
    [privilege_escalation]
    become = true
    become_method = sudo
    become_user = root

# inventory file
$ cat inventory
    [centos]
    192.168.10.20

    [debian]
    192.168.10.21

# variable
$ cat group_vars/redhat
    admin_group = wheel
    default_user_password: passwd

$ cat group_vars/ubuntu
    admin_group = sudo
    default_user_password: passwd

# create user
$ cat create-users.yml
---
- name: Create New Users
  hosts: all
  gather_facts: true
  tasks:
    - name: Create Users Task
      user:
        name: "{{ item }}"
        state: present
        password: "{{ default_user_password | password_hash('sha512', 'A512') }}"
        shell: /bin/bash
        groups: "{{ admin_group }}"
      loop:
        - bob
        - wendy
        - lofty
        - dizzy
...

# create user
$ ansible-playbook create-users.yml -b -K

# password
$ ansible-vault encrypt group_vars/redhat

# delete user
$ cat delete-users.yml
---
- name: clear user account
  hosts: all
  gather_facts: true
  become: true
  tasks:

    - name: delete users
      user:
        name: "{{ item }}"
        state: absent
        remove: true
      loop:
        - bob
        - dizzy
...