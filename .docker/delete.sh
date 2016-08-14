#!/usr/bin/env bash
CWD=$(pwd)
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DIR=$( dirname $SCRIPT_DIR )

cd $SCRIPT_DIR
./stop.sh

echo "Deleting containers..."
cd $DIR
docker rm -f $(docker-compose ps -q)

# Return to the cwd.
cd $CWD
