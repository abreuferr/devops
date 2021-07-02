# imagem a ser utilizada.
FROM debian

# atualizar o debian e intalar o wget, git e apache2
# 02 comandos em uma única camada.
RUN apt-get update ; apt-get install wget git apache2 -yq

# expor a porta 80.
EXPOSE 80

# executar o apache em foreground.
CMD ["apachectl", "-D", "FOREGROUND"]