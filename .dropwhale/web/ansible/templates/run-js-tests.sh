#!/usr/bin/env sh

# Clear the cache.
cd {{ web_dir }}
drush cr all

# Override the default Mink settings to point at the phantomjs container.
export MINK_DRIVER_ARGS='["http://phantomjs:8510"]'

# See https://www.drupal.org/node/2894501#comment-12281986
export MINK_DRIVER_ARGS_JS='["http://phantomjs:8510"]'

# Run the tests.
if [ -n $MODULE_NAME ] && [ -z $* ]; then
  php core/scripts/run-tests.sh \
      --url http://web \
      --dburl mysql://root:${MYSQL_ROOT_PASSWORD}@db/${MYSQL_DATABASE} \
      --php /usr/bin/php \
      --types "PHPUnit-FunctionalJavascript" \
      --module $MODULE_NAME
else
  php core/scripts/run-tests.sh \
      --url http://web \
      --dburl mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@db/${MYSQL_DATABASE} \
      --types "PHPUnit-FunctionalJavascript" \
      --php /usr/bin/php \
      $*
fi
