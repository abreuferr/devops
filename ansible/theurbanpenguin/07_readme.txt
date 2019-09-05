#: Title : ansible
#: Author : "Caio Abreu Ferreira" <abreuferr_gmail.com>
#: Description : Ansible Playbook Provisioning The Devops User
#: Options : https://www.youtube.com/channel/UCFFLP0dKesrKWccYscdAr9A

$ cat ansible.cfg
    [defaults]
    inventory = /Users/cosmo/myprojects/devops/ansible/theurbanpenguin/inventory
    remote_user = cosmo
    [privilege_escalation]
    become = false

$ cat inventory
    [centos]
    192.168.10.20
    [centos:vars]
    admin_group=wheel

    [debian]
    192.168.10.21
    [debian:vars]
    admin_group=sudo

# gerando o hash da senha
$ ansible localhost -m debug -a "msg={{ 'Passwd1' | password_hash('sha512', 'AZ') }}"
    localhost | SUCCESS => {
        "msg": "$6$AZ$kg1pcAkJMnrsDeYc2gLejzveZpc0nfBnYzANDubXaMo4JUA/tB43zU8HOzqUaZtc6POwmRR85dz2tdBsV1D5p1"
    }

# playbook
$ cat devops.yml
---
- name: deploy ansible user
  hosts: all
  tasks:

    - name: create user
      user:
        name: devops
        groups: "{{ admin_group }}"
        create_home: true
        comment: 'ansible management account'
        expires: -1
        password: '$6$AZ$kg1pcAkJMnrsDeYc2gLejzveZpc0nfBnYzANDubXaMo4JUA/tB43zU8HOzqUaZtc6POwmRR85dz2tdBsV1D5p1'

    - name: install ssh key
      authorized_key:
        user: devops
        state: present
        manage_dir: true
        key: "{{ lookup('file', '/Users/cosmo/.ssh/id_rsa.pub') }}"

    - name: setup devops sudo user
      copy:
        dest: /etc/sudoers.d/devops
        content: 'devops ALL=(ALL) NOPASSWD: ALL'
        validate: /usr/sbin/visudo -cf %s

# checando a sintaxe do arquivo "devops.yml"
$ ansible-playbook devops.yml --syntax-check

# execucao
$ ansible-playbook devops.yml -b -K