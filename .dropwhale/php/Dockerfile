FROM wodby/drupal-php:7.0
MAINTAINER tess@deninet.com

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
