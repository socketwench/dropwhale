FROM php:apache
MAINTAINER tess@deninet.com

RUN apt-get update && apt-get install -y \
            libfreetype6-dev \
            libjpeg62-turbo-dev \
            libmcrypt-dev \
            libpng12-dev \
            libicu-dev

RUN docker-php-ext-install gd json intl pdo pdo_mysql mbstring opcache

COPY php.ini /usr/local/etc/php/
