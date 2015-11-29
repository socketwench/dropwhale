FROM debian:latest
MAINTAINER your_email@example.com

RUN apt-get update && \
    apt-get -yq install git curl \
                        php5 php5-mysql php5-imagick php5-imap \
                        php5-mcrypt php5-curl php5-cli php5-gd \
                        php5-sqlite php5-common php-apc php-pear \
                        php5-json php5-memcache php5-intl \
                        mysql-client \
                        supervisor

RUN curl -sS https://getcomposer.org/installer | php

RUN mv composer.phar /usr/local/bin/composer && \
    ln -s /usr/local/bin/composer /usr/bin/composer

RUN composer global require drush/drush:dev-master && \
    ln -s /root/.composer/vendor/bin/drush /usr/bin/drush

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY init.sh /root/scripts/init.sh
RUN chmod +x /root/scripts/init.sh

COPY rebuild.sh /root/scripts/rebuild.sh

RUN chmod +x /root/scripts/rebuild.sh

CMD ["/usr/bin/supervisord", "-n"]