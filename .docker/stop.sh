#!/usr/bin/env bash
CWD=$(pwd)
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo "Killing containers..."

cd $DIR
docker-compose kill

# Return to the cwd.
cd $CWD
