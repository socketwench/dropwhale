#!/usr/bin/env bash
CWD=$(pwd)
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DIR=$( dirname $SCRIPT_DIR )

# Get the list of containers for this service, if any.
PS=$(cd $DIR && docker-compose ps -q)

echo "Starting containers..."
cd $DIR
docker-compose up -d

# If there were no containers before this is the first start. Build Drupal.
if [[ $PS == '' ]]; then
  ${SCRIPT_DIR}/build.sh
fi

# Return to the cwd.
cd $CWD
