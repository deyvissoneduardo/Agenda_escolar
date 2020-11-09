FROM php:7.3-fpm

RUN apt-get update && \
 docker-php-ext-install pdo pdo_mysql && \
 docker-php-ext-install mbstring && \
 docker-php-ext-install intl