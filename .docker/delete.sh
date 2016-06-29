#!/usr/bin/env bash

#
# delete.sh
#
# Kill and delete the containers, does not delete images.
#

CWD=$(pwd)

# Get the full path to the directory containing this script.
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

cd $DIR
./stop.sh

echo "Deleting containers..."
docker rm -f $(docker-compose ps -q)

# Return to the cwd.
cd $CWD
