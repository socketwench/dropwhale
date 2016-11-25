FROM wodby/drupal-nginx
MAINTAINER tess@deninet.com

ENV NGINX_SERVER_NAME=web \
    NGINX_UPSTREAM_NAME=php \
    DRUPAL_VERSION=8

COPY nginx.conf /etc/nginx/nginx.conf
COPY drupal* /opt/
