#!/usr/bin/env bash

#
# drupal.sh
#
# Run Drupal Console in the cli container.
#

# Get the full path to the directory containing this script.
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Invoke Drupal Console in the cli container, passing user input.
${DIR}/bash.sh drupal --root=/var/www/html --uri=http://web/ "$*"