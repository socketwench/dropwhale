#!/usr/bin/env sh

# Clear the cache.
cd {{ web_dir }}
drush cr all

# Run the tests.
cd {{ web_dir }}/core/
mkdir -m 777 -p {{ web_dir }}/sites/simpletest/browser_output

if [ -n $MODULE_NAME ] && [ -z $* ]; then
  ../vendor/bin/phpunit --printer="\Drupal\Tests\Listeners\HtmlOutputPrinter" --group $MODULE_NAME
else
  ../vendor/bin/phpunit --printer="\Drupal\Tests\Listeners\HtmlOutputPrinter" $*
fi
