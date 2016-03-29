#!/usr/bin/env bash

/root/scripts/init.sh

mkdir --parents --mode=777 /var/www/sites/default/files
drush si --uri=http://web --root=/var/www --db-url=mysql://${DB_1_ENV_MYSQL_USER}:${DB_ENV_MYSQL_PASS}@db/${DB_1_ENV_MYSQL_DB} -y

mkdir --parents --mode=777 /var/www/sites/simpletest
drush --uri=http://web --root=/var/www en -y simpletest

if [ -n "$MODULE_ENABLE" ]; then
    drush --uri=http://web --root=/var/www en -y ${MODULE_ENABLE};
fi