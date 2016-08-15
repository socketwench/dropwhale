#!/usr/bin/env bash

# Run the tests.
cd /var/www/html/
php core/scripts/run-tests.sh \
    --url http://web \
    --dburl mysql://${DB_1_ENV_MYSQL_USER}:${DB_ENV_MYSQL_PASSWORD}@db/${DB_1_ENV_MYSQL_DATABASE} \
    $*