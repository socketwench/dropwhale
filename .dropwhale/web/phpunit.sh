#!/usr/bin/env sh

# Clear the cache.
cd /var/www/html
drush cr all

# Run the tests.
cd /var/www/html/core/
mkdir -m 777 -p /var/www/html/sites/simpletest/browser_output

if [ -n $MODULE_NAME ] && [ -z $* ]; then
  ../vendor/bin/phpunit --printer="\Drupal\Tests\Listeners\HtmlOutputPrinter" --group $MODULE_NAME
else
  ../vendor/bin/phpunit --printer="\Drupal\Tests\Listeners\HtmlOutputPrinter" $*
fi
