#!/usr/bin/env bash

export SIMPLETEST_DB=mysql://${DB_1_ENV_MYSQL_USER}:${DB_ENV_MYSQL_PASSWORD}@db/${DB_1_ENV_MYSQL_DATABASE}
export SIMPLETEST_BASE_URL=http://web

cd /var/www/html/core/
../vendor/bin/phpunit $*