#!/usr/bin/env bash

#
# rebuild.sh
#
# Install Drupal.
#

# Set the default username and password if not set in the Compose override.
DRUPAL_USER=${DRUPAL_USER:-admin}
DRUPAL_PASSWORD=${DRUPAL_PASSWORD:-password}

# Since Drupal 8.1, we need to run a Composer install to get vendor files.
cd /var/www/html
composer install

# Make the default files directory and give it world permissions.
mkdir --parents --mode=777 /var/www/html/sites/default/files

# Run the Drupal installer.
drush si --uri=http://web --root=/var/www/html \
      --db-url=mysql://${DB_1_ENV_MYSQL_USER}:${DB_ENV_MYSQL_PASSWORD}@db/${DB_1_ENV_MYSQL_DATABASE} \
      -y \
      --account-name=$DRUPAL_USER --account-pass=$DRUPAL_PASSWORD

# Enable Simpletest.
mkdir --parents --mode=777 /var/www/html/sites/simpletest
drush --uri=http://web --root=/var/www/html en -y simpletest

chmod -R 777 /var/www/html/sites/default/files

# Print off the username and password.
echo Please login with $DRUPAL_USER/$DRUPAL_PASSWORD
