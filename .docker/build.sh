#!/usr/bin/env bash
CWD=$(pwd)
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DIR=$( dirname $SCRIPT_DIR )

echo "Building Drupal..."
${SCRIPT_DIR}/bash.sh /root/scripts/rebuild.sh

# Return to the cwd.
cd $CWD
