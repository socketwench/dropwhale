#!/usr/bin/env bash

cd /tmp

if [ -d /tmp/drupal ]; then
  cd /tmp/drupal
  git pull
else
  git clone --branch 8.0.x http://git.drupal.org/project/drupal.git
fi

cp -r /tmp/drupal/* /var/www/html/
cp /tmp/drupal/.htaccess /var/www/html
