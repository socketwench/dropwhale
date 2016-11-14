#!/usr/bin/env bash

#
# rebuild.sh
#
# Install Drupal.
#

# Set the default username and password if not set in the Compose override.
DRUPAL_USER=${DRUPAL_USER:-admin}
DRUPAL_PASSWORD=${DRUPAL_PASSWORD:-password}

# Download or update the Drupal core repository.
/root/scripts/init.sh

# Since Drupal 8.1, we need to run a Composer install to get vendor files.
cd /var/www/html
composer install

# Make the default files directory and give it world permissions.
mkdir --parents --mode=777 /var/www/html/sites/default/files

# Run the Drupal installer.
drush si --uri=http://web --root=/var/www/html \
      --db-url=mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@db/${MYSQL_DATABASE} \
      -y \
      --account-name=$DRUPAL_USER --account-pass=$DRUPAL_PASSWORD

# Enable Simpletest.
mkdir --parents --mode=777 /var/www/html/sites/simpletest
drush --uri=http://web --root=/var/www/html en -y simpletest

# If we specified modules to enable in the Composer override, enable them all now.
if [ -n "$MODULE_ENABLE" ]; then
    drush --uri=http://web --root=/var/www/html en -y ${MODULE_ENABLE};
fi

chmod -R 777 /var/www/html/sites/default/files

# Print off the username and password.
echo Please login with $DRUPAL_USER/$DRUPAL_PASSWORD
