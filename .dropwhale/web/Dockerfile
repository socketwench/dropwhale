FROM ten7/dockstack-php-apache:latest
MAINTAINER tess@deninet.com

ENV DRUPAL_VERSION=8

RUN mkdir -p /etc/ansible/ && \
    echo localhost ansible_connection=local > /etc/ansible/hosts

COPY ansible/ /var/ansible/

# Change permissions to the xdebug logs so testing doesn't error out.
RUN chown -R apache:www-data /var/log/apache2/

# Copy various Dropwhale-specific scripts and mark as executable.
COPY phpunit.sh /scripts/phpunit.sh
RUN chown apache:www-data /scripts/phpunit.sh
RUN chmod +x /scripts/phpunit.sh

COPY run-tests.sh /scripts/run-tests.sh
RUN chown apache:www-data /scripts/run-tests.sh
RUN chmod +x /scripts/run-tests.sh
