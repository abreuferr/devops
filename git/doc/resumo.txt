1 - Git

# log
#
$ git log # log do git
$ git log --oneline # cada log em uma única linha
$ git log --graph # log em formato gráfico

# ir até um determinado commit
#
$ git log --oneline # obter o ID do commit
$ git checkout <ID_COMMIT> # ir até um determi
$ git log --oneline # log
$ git checkout main # ir até o último commit (main)
$ git log --oneline # log

# reverter um determinado commit
#
$ git log --oneline # obter o ID do commit
$ git revert <ID_COMMIT> # reverter um determinado commit
$ git log --oneline # log

# reinicializar a partir de um determinado commit
#
# OS COMMITS FUTUROS SERÃO APAGADOS
#
$ git log --oneline # obter o ID do commit
$ git reset <ID_COMMIT> # reverter um determinado commit
$ git log --oneline # log

# branch
#
$ git status
$ git branch <BRANCH_NAME> # criar uma branch
$ git checkout <BRANCH_NAME> # acessar uma branch
$ git branch -b <BRANCH_NAME> # cria uma nova branch e acessa a branch <BRANCH_NAME>
$ git branch --delete <BRANCH_NAME> # apagar uma branch

# branch (MERGE)
#
$ git checkout main
$ git merge <BRANCH_NAME>
$ git log