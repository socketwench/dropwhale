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

echo "Delete the Dropwhale containers for this module?"
read -p "(y/n)" -n 1 -r
echo    # move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

echo "Stopping Dropwhale..."
cd $DIR
docker-compose kill

echo "Deleting Dropwhale containers..."
docker-compose rm -vf

# Return to the cwd.
cd $CWD
