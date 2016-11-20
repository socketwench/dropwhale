#!/usr/bin/env bash

# Set some required variables for PHPUnit.
export SIMPLETEST_DB=mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@db/${MYSQL_DATABASE}
export SIMPLETEST_BASE_URL=http://web
export BROWSERTEST_OUTPUT_DIRECTORY=/var/www/html/sites/simpletest/browser_output

# Run the tests.
cd /var/www/html/core/
../vendor/bin/phpunit --printer="\Drupal\Tests\Listeners\HtmlOutputPrinter" $*
