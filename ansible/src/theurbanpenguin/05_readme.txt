#: Title : ansible
#: Author : "Caio Abreu Ferreira" <abreuferr_gmail.com>
#: Description : Ansible - Running Ad-Hoc Commands
#: Options : https://www.youtube.com/channel/UCFFLP0dKesrKWccYscdAr9A

$ ansible all -i inventory.yml -m ping
$ ansible all -i inventory.yml -m user -a "name=cosmo state=present"
$ ansible all -i inventory.yml -m user -a "name=caio state=absent"