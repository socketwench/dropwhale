#!/usr/bin/env bash

#
# start.sh
#
# Start Dropwhale containers.
#

# Save the current working directory.
CWD=$(pwd)

# Get the full path to the directory containing this script.
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Get the directory of the docker-compose.yml
DIR=$( dirname $SCRIPT_DIR )

# Exit if the settings file wasn't created yet.
if [ ! -f $DIR/dropwhale.settings ]; then
  echo "Cannot find dropwhale.settings! Please use the dropwhale.settings.example file to create it."
  exit 1;
fi

# Get the list of containers for this service, if any.
PS=$(cd $DIR && docker-compose ps -q)

echo "Starting Dropwhale..."
cd $DIR
docker-compose up -d

# If there were no containers before this is the first start. Build Drupal.
if [[ $PS == '' ]]; then
  ${SCRIPT_DIR}/reset.sh
fi

# Return to the cwd.
cd $CWD
