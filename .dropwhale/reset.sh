#!/usr/bin/env bash

#
# build.sh
#
# Install or reinstall Drupal. Run this to get a clean environment.
#

# Save the current working directory.
CWD=$( pwd )

# Get the full path to the directory containing this script.
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Get the directory of the docker-compose.yml
DIR=$( dirname $SCRIPT_DIR )

# Run the rebuild script in the cli container.
echo "Building Drupal..."
${SCRIPT_DIR}/bash.sh ansible-playbook -i /ansible/inventory/dropwhale /ansible/reset.yml

# Return to the cwd.
cd $CWD
