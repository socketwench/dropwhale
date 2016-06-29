#!/usr/bin/env bash

# Set the default username and password if not set in the Compose override.
DRUPAL_USER=${DRUPAL_USER:-admin}
DRUPAL_PASSWORD=${DRUPAL_PASSWORD:-password}

/root/scripts/init.sh

cd /var/www/html
composer install

mkdir --parents --mode=777 /var/www/html/sites/default/files
drush si --uri=http://web --root=/var/www/html \
      --db-url=mysql://${DB_1_ENV_MYSQL_USER}:${DB_ENV_MYSQL_PASSWORD}@db/${DB_1_ENV_MYSQL_DATABASE} \
      -y \
      --account-name=$DRUPAL_USER --account-pass=$DRUPAL_PASSWORD

mkdir --parents --mode=777 /var/www/html/sites/simpletest
drush --uri=http://web --root=/var/www/html en -y simpletest

if [ -n "$MODULE_ENABLE" ]; then
    drush --uri=http://web --root=/var/www/html en -y ${MODULE_ENABLE};
fi

chmod -R 777 /var/www/html/sites/default/files

echo Please login with $DRUPAL_USER/$DRUPAL_PASSWORD