FROM php:apache
MAINTAINER tess@deninet.com

RUN apt-get update && apt-get install -y \
            libfreetype6-dev \
            libjpeg62-turbo-dev \
            libmcrypt-dev \
            libpng12-dev \
            libicu-dev

RUN docker-php-ext-install gd json intl pdo pdo_mysql mbstring opcache

COPY xdebug-2.4.0.tgz xdebug-2.4.0.tgz

RUN tar -xzf xdebug-2.4.0.tgz && \
    cd xdebug-2.4.0/xdebug-2.4.0 && \
    phpize && \
    ./configure && \
    make && \
    cp modules/xdebug.so /usr/local/lib/php/extensions/no-debug-non-zts-20151012

COPY php.ini /usr/local/etc/php/