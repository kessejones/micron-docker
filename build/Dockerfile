FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

# Atualizando repositórios e adicionando repositorio do PHP7.3
RUN apt update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ondrej/php
RUN apt update

# Instalando utilitários
RUN apt install -y sudo vim

# Instalando serviços
RUN apt install -y apache2 redis-server
RUN apt install -y libxml2 libxml2-dev libpng-dev libjpeg-dev
RUN apt install -y php7.3 php7.3-json php7.3-mysql php7.3-mbstring php7.3-xml php7.3-gd php7.3-redis php7.3-xdebug php7.3-curl
RUN apt install -y composer

# Ajustando timezone do container
RUN ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/timezone

# Habilitando modulos do apache
RUN a2enmod rewrite
RUN a2enmod proxy
RUN a2enmod proxy_http

# Configurações do apache
COPY ./apache2/ports.conf /etc/apache2/ports.conf
COPY ./apache2/sites /etc/apache2/sites-enabled

# Configurações do php
COPY ./php/php.ini /usr/etc/php/7.3/apache/php.ini
COPY ./php/php.ini /usr/etc/php/7.3/cli/php.ini
COPY ./php/xdebug.ini /etc/php/7.3/apache/conf.d/20-xdebug.ini
COPY ./php/xdebug.ini /etc/php/7.3/cli/conf.d/20-xdebug.ini

# Configuração do redis
COPY ./redis/redis.conf /etc/redis/redis.conf

# Script de inicialização dos serviços
COPY ./start.sh /start.sh 
RUN chmod +x /start.sh

# Criando um usuário comum com permissões de root
RUN useradd -ms /bin/bash default
RUN usermod -aG sudo default
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Definindo diretório de trabalho e usuário padrão.
USER default
WORKDIR /var/www

CMD ["/start.sh"]

