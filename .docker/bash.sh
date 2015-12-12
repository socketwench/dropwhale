#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

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
