#: Title : amsible
#: Author : "Caio Abreu Ferreira" <abreuferr_gmail.com>
#: Description : Using Ansible Variables in Inventory Files
#: Options : https://www.youtube.com/channel/UCFFLP0dKesrKWccYscdAr9A

# inventory
$ cat inventory
    192.168.10.[20:21]

    [centos7]
    192.168.10.20
    [debian10]
    192.168.10.21

    [matriz]
    192.168.10.20
    [filial]
    192.168.10.21

    [centos:children]
    centos7
    [debian:children]
    debian10

    [centos:vars]
    apache_package=httpd
    [debian:vars]
    apache_package=apache2

# instalacao do apache no CentOS e no Debian.
$ ansible centos -i inventory -m yum -a 'name="{{ apache_package }}" state=installed' -b -K
$ ansible debian -i inventory -m apt -a 'name="{{ apache_package }}" state=installed' -b -K

# YAML
$ cat inventory.yml
---
all:
  children:
    matriz:
      children:
        hosts:
            192.168.10.20: {}
    filial:
      children:
        hosts:
            192.168.10.21: {}

    centos:
      vars:
        apache_package: httpd
      children:
        cento7:
          hosts:
            192.168.10.20: {}
    debian:
      vars:
        apache_package: apache2
      children:
        debian10:
          hosts:
            192.168.10.21: {}

# desinstalacao do apache no CentOS e no Debian.
$ ansible centos -i inventory.yml -m yum -a 'name="{{ apache_package }}" state=absent' -b -K
$ ansible debian -i inventory.yml -m apt -a 'name="{{ apache_package }}" state=absent' -b -K