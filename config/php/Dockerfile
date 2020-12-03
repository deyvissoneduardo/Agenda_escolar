FROM php:8.0-fpm
LABEL <Deyvisson Eduardo>="<deyvissonarouche@gmail.com>"

RUN apt-get update && \
 docker-php-ext-install pdo pdo_mysql && \
 docker-php-ext-install mbstring && \
 docker-php-ext-install intl

RUN apt-get install -y iputils-ping
