#!/usr/bin/env bash

#
# stop.sh
#
# Stop Dropwhale containers, do not delete them.
#

# Save the current directory.
CWD=$(pwd)

# Get the full path to the directory containing this script.
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Get the directory of the docker-compose.yml
DIR=$( dirname $SCRIPT_DIR )

echo "Killing containers..."

cd $DIR
docker-compose kill

# Return to the cwd.
cd $CWD
