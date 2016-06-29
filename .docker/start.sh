#!/usr/bin/env bash

#
# start.sh
#
# Start Dropwhale containers.
#

# Save the current working directory.
CWD=$(pwd)

# Get the full path to the directory containing this script.
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Get the list of containers for this service, if any.
PS=$(cd $DIR && docker-compose ps -q)

echo "Starting containers..."
cd $DIR
docker-compose up -d

# If there were no containers before this is the first start. Build Drupal.
if [[ $PS == '' ]]; then
  ${DIR}/build.sh
fi

# Return to the cwd.
cd $CWD
