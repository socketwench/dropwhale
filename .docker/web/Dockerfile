FROM socketwench/drupal-base
MAINTAINER tess@deninet.com

COPY xdebug-2.4.0.tgz xdebug-2.4.0.tgz

RUN tar -xzf xdebug-2.4.0.tgz && \
    cd xdebug-2.4.0/xdebug-2.4.0 && \
    phpize && \
    ./configure && \
    make && \
    cp modules/xdebug.so /usr/local/lib/php/extensions/no-debug-non-zts-20151012

COPY php.ini /usr/local/etc/php/