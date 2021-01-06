FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update

RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ondrej/php
RUN apt update

RUN apt install -y vim

RUN apt install -y libxml2 libxml2-dev libpng-dev libjpeg-dev
RUN apt install -y apache2
RUN apt install -y php7.3 php7.3-json php7.3-mysql php7.3-mbstring php7.3-xml php7.3-gd php7.3-redis php7.3-xdebug php7.3-curl

RUN apt install -y composer
RUN apt install -y redis-server

RUN ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/timezone

RUN a2enmod rewrite
RUN a2enmod proxy
RUN a2enmod proxy_http

RUN echo "#!/bin/bash\nservice apache2 start && service redis-server start && tail -f /dev/null" > /usr/bin/start-services
