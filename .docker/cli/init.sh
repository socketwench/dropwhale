#!/usr/bin/env bash

DRUPAL_BRANCH=${DRUPAL_BRANCH:-HEAD}

cd /tmp

if [ -d /tmp/drupal ]; then
  cd /tmp/drupal
  git pull
elif [ "$DRUPAL_BRANCH" != "HEAD" ]; then
  echo Using branch $DRUPAL_BRANCH
  git clone --branch $DRUPAL_BRANCH http://git.drupal.org/project/drupal.git
else
  git clone http://git.drupal.org/project/drupal.git
fi

cp -r /tmp/drupal/* /var/www/html/
cp /tmp/drupal/.htaccess /var/www/html
