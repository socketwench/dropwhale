#!/usr/bin/env bash
CWD=$(pwd)
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DIR=$( dirname $SCRIPT_DIR )

${SCRIPT_DIR}/bash.sh drush --root=/var/www/html --uri=http://web/ "$*"

# Return to the cwd.
cd $CWD
