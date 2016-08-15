#!/usr/bin/env bash
#
# run-tests.sh
#
# Run Drupal tests in the cli container.
#

# Save the current working directory.
CWD=$( pwd )

# Get the full path to the directory containing this script.
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Get the directory of the docker-compose.yml
DIR=$( dirname $SCRIPT_DIR )

# Invoke our run-tests.sh script in the cli container.
${SCRIPT_DIR}/bash.sh /root/scripts/run-tests.sh "$*"

# Return to the cwd.
cd $CWD
