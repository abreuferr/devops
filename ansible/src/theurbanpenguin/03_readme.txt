#: Title : ansible
#: Author : "Caio Abreu Ferreira" <abreuferr_gmail.com>
#: Description : Understanding Ansible Inventory Files
#: Options : https://www.youtube.com/channel/UCFFLP0dKesrKWccYscdAr9A

$ cat inventory
    [centos]
    192.168.10.20

    [debian]
    192.168.10.21

    [matriz]
    192.168.10.20

    [filial]
    192.168.10.21

    [sp:children]
    matriz

    [rj:children]
    filial

# listar inventario
$ ansible -i inventory all --list-hosts
$ ansible -i inventory centos --list-hosts
$ ansible -i inventory filial --list-hosts
$ ansible -i inventory rj --list-hosts