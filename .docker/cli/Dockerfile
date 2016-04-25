FROM drush/drush
MAINTAINER tess@deninet.com

RUN apt-get update && \
    apt-get -yq install supervisor

# Manually install Drupal Console due to https://github.com/hechoendrupal/DrupalConsole/issues/2064
RUN curl https://drupalconsole.com/installer -L -o drupal.phar && \
    chmod +x drupal.phar && \
    mv drupal.phar /usr/bin/drupal

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY init.sh /root/scripts/init.sh
RUN chmod +x /root/scripts/init.sh

COPY rebuild.sh /root/scripts/rebuild.sh

RUN chmod +x /root/scripts/rebuild.sh

CMD ["-n"]

ENTRYPOINT ["/usr/bin/supervisord"]
