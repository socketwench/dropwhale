FROM ten7/dockstack-php-apache:latest
MAINTAINER tess@deninet.com

ENV DRUPAL_VERSION=8

RUN apk -U upgrade && \
    apk --update --no-cache add \
        rsync \
        ansible \
        openssh-client  && \
        rm -rf /tmp/* && \
        rm -rf /var/cache/apk/*

RUN mkdir -p /etc/ansible/ && \
    echo localhost ansible_connection=local > /etc/ansible/hosts

COPY ansible/ /var/ansible/

# Copy various Dropwhale-specific scripts and mark as executable.
COPY phpunit.sh /root/scripts/phpunit.sh
RUN chmod +x /root/scripts/phpunit.sh

COPY run-tests.sh /root/scripts/run-tests.sh
RUN chmod +x /root/scripts/run-tests.sh
