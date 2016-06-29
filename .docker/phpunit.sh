#!/usr/bin/env bash
#
# phpunit.sh
#
# Run PHPUnit in the cli container.
#

# Get the full path to the directory containing this script.
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Invoke our phpunit.sh script in the cli container.
${DIR}/bash.sh /root/scripts/phpunit.sh "$*"
