FROM wodby/drupal-php:7.0
MAINTAINER tess@deninet.com

# RUN apk update && \
#     apk add --no-cache ansible && \
#     rm -rf /tmp/* && \
#     rm -rf /var/cache/apk/*

ENV PHP_SITE_NAME=web \
    PHP_HOST_NAME=php:8000 \
    PHP_SENDMAIL_PATH=/usr/sbin/sendmail\ -t\ -i\ -S\ mailhog:1025

#ENV PHP_XDEBUG_ENABLED=1 \
#    PHP_XDEBUG_AUTOSTART=1 \
#    PHP_XDEBUG_REMOTE_CONNECT_BACK=0 \        # This is needed to respect remote.host setting bellow
#    PHP_XDEBUG_REMOTE_HOST="10.254.254.254"  # You will also need to 'sudo ifconfig lo0 alias 10.254.254.254'

COPY php.ini /etc/php7/php.ini

# Install Drupal console
RUN cd /tmp && \
    curl https://drupalconsole.com/installer -L -o drupal.phar && \
    mv drupal.phar /usr/local/bin/drupal && \
    chmod +x /usr/local/bin/drupal

# Copy various Dropwhale-specific scripts and mark as executable.
COPY init.sh /root/scripts/init.sh
RUN chmod +x /root/scripts/init.sh

COPY rebuild.sh /root/scripts/rebuild.sh
RUN chmod +x /root/scripts/rebuild.sh

COPY phpunit.sh /root/scripts/phpunit.sh
RUN chmod +x /root/scripts/phpunit.sh

COPY run-tests.sh /root/scripts/run-tests.sh
RUN chmod +x /root/scripts/run-tests.sh

WORKDIR /var/www/html
