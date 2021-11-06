FROM   debian
RUN    apt-get update ; \
       apt-get install -yq \
       wget \
       git \  
       apache2
EXPOSE 80
CMD    ["apachectl", "-D", "FOREGROUND"] 
