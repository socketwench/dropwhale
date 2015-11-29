#!/usr/bin/env bash

cd /tmp

git clone --branch 8.0.x http://git.drupal.org/project/drupal.git

cp -r drupal/* /var/www/
cp drupal/.htaccess /var/www