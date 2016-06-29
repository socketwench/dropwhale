#!/usr/bin/env bash

#
# drush.sh
#
# Run drush in the cli container.
#

# Get the full path to the directory containing this script.
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Invoke drush in the cli container, passing any user input.
${DIR}/bash.sh drush --root=/var/www/html --uri=http://web/ "$*"
