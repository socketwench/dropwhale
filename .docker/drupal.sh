#!/usr/bin/env bash

#
# drupal.sh
#
# Run Drupal Console in the cli container.
#

# Save the current working directory.
CWD=$( pwd )

# Get the full path to the directory containing this script.
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Get the directory of the docker-compose.yml
DIR=$( dirname $SCRIPT_DIR )

# Invoke Drupal Console in the cli container, passing user input.
${SCRIPT_DIR}/bash.sh drupal --root=/var/www/html --uri=http://web/ "$*"

# Return to the cwd.
cd $CWD
