#!/usr/bin/env bash
CWD=$(pwd)
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo "Starting containers..."
cd $DIR
docker-compose up -d

# Return to the cwd.
cd $CWD
