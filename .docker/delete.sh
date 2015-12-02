#!/usr/bin/env bash
CWD=$(pwd)
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

cd $DIR
./stop.sh

echo "Deleting containers..."
docker rm -f $(docker-compose ps -q)

# Return to the cwd.
cd $CWD
