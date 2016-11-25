#!/usr/bin/env sh

# Run the tests.
cd /var/www/html/
php core/scripts/run-tests.sh \
    --url http://web \
    --dburl mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@db/${MYSQL_DATABASE} \
    --php /usr/bin/php \
    $*
