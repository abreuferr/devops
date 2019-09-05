#: Title : amsible
#: Author : "Caio Abreu Ferreira" <abreuferr_gmail.com>
#: Description : Tutorial sobre o Ansible - Ansible Distribute SSH Public Keys
#: Options : https://www.youtube.com/channel/UCFFLP0dKesrKWccYscdAr9A

##
# Ansible Distribute SSH Public Keys
##

# instalar o aplicativo "sshpass".

# arquivo com uma lista dos hosts
$ cat inventory
    192.168.10.2[0:1]

# arquivo de configuracao
$ cat ansible.cfg
    [defaults]
    inventory=/Users/cosmo/myprojects/devops/ansible/theurbanpenguin/inventory
    remote_user=cosmo

# listar os hosts do inventory
$ ansible all --lists-hosts
  hosts (2):
    192.168.10.20
    192.168.10.21

# adicionar hosts no arquivo ~/.ssh/known_hosts.
$ ssh-keyscan 192.168.10.21 >> ~/.ssh/known_hosts

# gerando as chaves RSA, publica e privada.
$ ssh-keygen -t rsa

# comando "ssh-add"
$ ssh-agent bash
$ ssh-agent zsh
$ ssh-add ~/.ssh/id_rsa

# arquivo de configuracao da chave.
$ cat keys.yml
---
- name: add keys to hosts
  hosts: all
  tasks: 
  - name: install key
    authorized_key:
      user: cosmo
      state: present
      key: "{{ lookup('file', '/Users/cosmo/.ssh/id_rsa.pub') }}"

# checando o arquivo key.yml
$ ansible-playbook --syntax-check keys.yml

# enviando a chave publica para todos os hosts
# listados no arquivo "inventory".
$ ansible-playbook -k keys.yml