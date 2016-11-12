#!/usr/bin/env bash

# Set some required variables for PHPUnit.
export SIMPLETEST_DB=mysql://${DB_1_ENV_MYSQL_USER}:${DB_ENV_MYSQL_PASSWORD}@db/${DB_1_ENV_MYSQL_DATABASE}
export SIMPLETEST_BASE_URL=http://web
export BROWSERTEST_OUTPUT_DIRECTORY=/var/www/html/sites/simpletest/browser_output

# Run the tests.
cd /var/www/html/core/
../vendor/bin/phpunit $*