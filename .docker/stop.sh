#!/usr/bin/env bash

#
# stop.sh
#
# Stop Dropwhale containers, do not delete them.
#

# Save the current directory.
CWD=$(pwd)

# Get the full path to the directory containing this script.
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo "Killing containers..."

cd $DIR
docker-compose kill

# Return to the cwd.
cd $CWD
