FROM socketwench/drupal-cli
MAINTAINER tess@deninet.com

# Install phpcs and Drupal code sniffer
RUN composer global require drupal/coder && \
    phpcs --config-set installed_paths /composer/vendor/drupal/coder/coder_sniffer

COPY init.sh /root/scripts/init.sh
RUN chmod +x /root/scripts/init.sh

COPY rebuild.sh /root/scripts/rebuild.sh
RUN chmod +x /root/scripts/rebuild.sh

COPY phpunit.sh /root/scripts/phpunit.sh
RUN chmod +x /root/scripts/phpunit.sh

COPY run-tests.sh /root/scripts/run-tests.sh
RUN chmod +x /root/scripts/run-tests.sh
