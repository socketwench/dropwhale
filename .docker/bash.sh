#!/usr/bin/env bash
CWD=$(pwd)
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DIR=$( dirname $SCRIPT_DIR )

PS=$(cd $DIR && docker-compose ps -q)

if [[ $PS == '' ]]; then
	echo "No containers found."
	exit
fi

if [[ $1 == '' ]]; then
	echo "Starting bash..."
	docker exec -it $(cd $DIR && docker-compose ps -q cli) bash -i
else
	docker exec -it $(cd $DIR && docker-compose ps -q cli) bash -ic "$*"
fi

# Return to the cwd.
cd $CWD
