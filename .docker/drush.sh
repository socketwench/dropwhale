#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

${DIR}/bash.sh drush --root=/var/www --uri=http://web/ "$*"
