#: Title : amsible
#: Author : "Caio Abreu Ferreira" <abreuferr_gmail.com>
#: Description : Tutorial sobre o Ansible - Installing Ansible
#: Options : https://www.youtube.com/channel/UCFFLP0dKesrKWccYscdAr9A

##
# Installing Ansible
##

# instalacao
#
$ https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

# centos 7
#
$ sudo yum install epel-release -y
$ sudo yum install ansible -y

# debian 10
#
$ sudo cat /etc/apt/sources.list file:
  deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
$ sudo apt update
$ sudo apt install ansible

# versao do ansible
#
$ ansible --version