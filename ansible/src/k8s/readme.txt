#: Title : ansible e k8s
#: Author : "Caio Abreu Ferreira" <abreuferr_gmail.com>
#: Description : Instalacao do k8s em estacoes GNU/Linux Debian via Ansible
#: Options :

#
# configuracao do ansible
#

# arquivo com o inventario.
$ cat inventory

# verificando a lista de kmaster
$ ansible kmaster --list-hosts

# verificando a lista de knode
$ ansible knode --list-hosts

# arquivo de configuracao do ansible.
$ cat ansible.cfg

#
# chave gpg para os hosts
#

# playbook para a distribuicao da chave gpg.
$ cat keys.yml

# distribuindo a chave publica para o kmaster e knode
$ ansible-playbook -k keys.yml

# comando ssh.
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_rsa

#
# docker
#

# playbook de instalacao do docker no debian.
$ cat docker_install_debian.yml

# checando o arquivo 
$ ansible-playbook docker_install_debian.yml --syntax-check

# excutando o playbook somente sobre o host "kmaster"
$ ansible-playbook --limit kmaster docker_install_debian.yml -b -K

# excutando o playbook somente sobre os hosts "knode"
$ ansible-playbook --limit knode docker_install_debian.yml -b -K

#
# swap
#

# desabilitar o swap
$ cat disable_swap.yml

# checar a sintaxe do playbook disable_swap.yml
$ ansible-playbook disable_swap.yml --syntax-check

# excutando o playbook somente sobre o host "kmaster"
$ ansible-playbook --limit kmaster disable_swap.yml -b -K

# excutando o playbook somente sobre os hosts "knode"
$ ansible-playbook --limit knode disable_swap.yml -b -K

#
# k8s
#

# instalacao - todos os hosts do cluster

# playbook de instalacao do k8s
$ cat k8s_install_debian.yml

# checando o playbook
$ ansible-playbook k8s_install_debian.yml --syntax-check

# instalacao do k8s no kmaster
$ ansible-playbook --limit kmaster k8s_install_debian.yml -b -K

# instalacao do k8s no knode
$ ansible-playbook --limit knode k8s_install_debian.yml -b -K

# configuracao do master do cluster

# playbook de configuracao do k8s master do cluster
$ cat master-cluster.yml

# checando o playbook
$ ansible-playbook master-cluster.yml --syntax-check

# executando o playbook
$ ansible-playbook master-cluster.yml -b -K


