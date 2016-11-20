#!/bin/sh

# Get the installer signature from github.
EXPECTED_SIGNATURE=$(curl -s https://composer.github.io/installer.sig)

# Download the installer.
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

# Generate the signature of the file we downloaded.
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

# If the sigs don't match, abort.
if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

# Otherwise, install Composer.
php composer-setup.php --quiet
RESULT=$?

# Do some cleanup.
mv composer.phar /usr/local/bin/composer
rm composer-setup.php

exit $RESULT
