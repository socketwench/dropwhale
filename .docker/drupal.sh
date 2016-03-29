#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

${DIR}/bash.sh drupal --root=/var/www --uri=http://web/ "$*"