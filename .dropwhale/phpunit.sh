#!/usr/bin/env bash
#
# phpunit.sh
#
# Run PHPUnit in the cli container.
#

# Save the current working directory.
CWD=$( pwd )

# Get the full path to the directory containing this script.
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Get the directory of the docker-compose.yml
DIR=$( dirname $SCRIPT_DIR )

# Invoke our phpunit.sh script in the cli container.
${SCRIPT_DIR}/bash.sh /scripts/phpunit.sh "$*"

# Return to the cwd.
cd $CWD
