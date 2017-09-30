#!/usr/bin/env bash

#
# phpcs.sh
#
# Run phpcs against the module or passed parameters.
#

# Save the current working directory.
CWD=$( pwd )

# Get the full path to the directory containing this script.
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Get the directory of the docker-compose.yml
DIR=$( dirname $SCRIPT_DIR )

# Invoke drush in the cli container, passing any user input.
${SCRIPT_DIR}/bash.sh /scripts/phpcs.sh "$*"
# Return to the cwd.
cd $CWD
