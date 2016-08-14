#!/usr/bin/env bash
CWD=$(pwd)
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DIR=$( dirname $SCRIPT_DIR )

echo "Killing containers..."

cd $DIR
docker-compose kill

# Return to the cwd.
cd $CWD
