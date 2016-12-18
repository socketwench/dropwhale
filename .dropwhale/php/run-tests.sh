#!/usr/bin/env sh

cd /var/www/html/

# Run the tests.
if [ -n $MODULE_NAME ] && [ -z $* ]; then
  php core/scripts/run-tests.sh \
      --url http://web \
      --dburl mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@db/${MYSQL_DATABASE} \
      --php /usr/bin/php \
      --module $MODULE_NAME
else
  php core/scripts/run-tests.sh \
      --url http://web \
      --dburl mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@db/${MYSQL_DATABASE} \
      --php /usr/bin/php \
      $*
fi
