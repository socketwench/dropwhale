#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo "Building Drupal..."
${DIR}/bash.sh /root/scripts/rebuild.sh
