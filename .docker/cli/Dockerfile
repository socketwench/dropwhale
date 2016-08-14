FROM socketwench/drupal-cli
MAINTAINER tess@deninet.com

COPY init.sh /root/scripts/init.sh
RUN chmod +x /root/scripts/init.sh

COPY rebuild.sh /root/scripts/rebuild.sh
RUN chmod +x /root/scripts/rebuild.sh

COPY phpunit.sh /root/scripts/phpunit.sh
RUN chmod +x /root/scripts/phpunit.sh
