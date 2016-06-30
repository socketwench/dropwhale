#!/usr/bin/env bash
#
# run-tests.sh
#
# Run Drupal tests in the cli container.
#

# Get the full path to the directory containing this script.
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Invoke our run-tests.sh script in the cli container.
${DIR}/bash.sh /root/scripts/run-tests.sh "$*"
