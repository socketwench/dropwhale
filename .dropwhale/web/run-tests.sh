#!/usr/bin/env sh

# Clear the cache.
cd /var/www/html
drush cr all

# Run the tests.
if [ -n $MODULE_NAME ] && [ -z $* ]; then
  php core/scripts/run-tests.sh \
      --url http://web \
      --dburl mysql://root:${MYSQL_ROOT_PASSWORD}@db/${MYSQL_DATABASE} \
      --php /usr/bin/php \
      --module $MODULE_NAME
else
  php core/scripts/run-tests.sh \
      --url http://web \
      --dburl mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@db/${MYSQL_DATABASE} \
      --php /usr/bin/php \
      $*
fi
