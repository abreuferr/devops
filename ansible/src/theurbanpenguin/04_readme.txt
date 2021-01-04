#: Title : ansible
#: Author : "Caio Abreu Ferreira" <abreuferr_gmail.com>
#: Description : Building Ansible YAML Inventory Files
#: Options : https://www.youtube.com/channel/UCFFLP0dKesrKWccYscdAr9A

# Inventory no formato YAML
$ cat inventory.yml
---
all:
  children:
    sp:
      children:
        matriz:
          hosts:
            192.168.10.20:
    rj:
      children:
        filial:
          hosts:
            192.168.10.21:

    centos:
      hosts:
        192.168.10.20:
    debian:
      hosts:
        192.168.10.21:

# listar inventario
# listar inventario
$ ansible -i inventory.yml all --list-hosts
$ ansible -i inventory.yml centos --list-hosts
$ ansible -i inventory.yml filial --list-hosts
$ ansible -i inventory.yml rj --list-hosts