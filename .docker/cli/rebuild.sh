#!/usr/bin/env bash

/root/scripts/init.sh

mkdir /var/www/sites/default
mkdir /var/www/sites/default/files
chmod -R 777 /var/www/sites/default

mkdir /var/www/sites/simpletest
chmod -R 777 /var/www/sites/simpletest

drush si --uri=http://web --root=/var/www --db-url=mysql://${DB_1_ENV_MYSQL_USER}:${DB_ENV_MYSQL_PASS}@db/${DB_1_ENV_MYSQL_DB} -y

