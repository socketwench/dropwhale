#!/usr/bin/env bash

#
# build.sh
#
# Install or reinstall Drupal. Run this to get a clean environment.
#

# Get the full path to the directory containing this script.
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Run the rebuild script in the cli container.
echo "Building Drupal..."
${DIR}/bash.sh /root/scripts/rebuild.sh
