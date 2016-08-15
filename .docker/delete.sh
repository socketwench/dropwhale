#!/usr/bin/env bash

#
# delete.sh
#
# Kill and delete the containers, does not delete images.
#

# Save the current working directory.
CWD=$( pwd )

# Get the full path to the directory containing this script.
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Get the directory of the docker-compose.yml
DIR=$( dirname $SCRIPT_DIR )

echo "Stopping containers..."
cd $DIR
docker-compose kill

echo "Deleting containers..."
docker-compose rm -v

# Return to the cwd.
cd $CWD
