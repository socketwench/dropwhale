#!/usr/bin/env sh

# Clear the cache.
cd {{ web_dir }}
drush cr

# Run the tests.
if [ -n $MODULE_NAME ] && [ -z $* ]; then
  php core/scripts/run-tests.sh \
      --url {{ drupal_uri }} \
      --dburl mysql://root:${MYSQL_ROOT_PASSWORD}@db/${MYSQL_DATABASE} \
      --php /usr/bin/php \
      --module $MODULE_NAME
else
  php core/scripts/run-tests.sh \
      --url {{ drupal_uri }} \
      --dburl mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@db/${MYSQL_DATABASE} \
      --php /usr/bin/php \
      $*
fi
