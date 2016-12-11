#!/usr/bin/env bash

#
# bash.sh
#
# Provide an interactive bash shell or run a bash command in the cli container.
#

# Save the current working directory.
CWD=$( pwd )

# Get the full path to the directory containing this script.
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Get the directory of the docker-compose.yml
DIR=$( dirname $SCRIPT_DIR )

# Get a list of all the Dropwhale containers running.
PS=$(cd $DIR && docker-compose ps -q)

# Stop if no containers are found.
if [[ $PS == '' ]]; then
	echo "No containers found."
	exit
fi

# Start bash in the cli container.
if [[ $1 == '' ]]; then
	echo "Starting bash..."
	docker exec -it $(cd $DIR && docker-compose ps -q php) bash -i
else
	docker exec -it $(cd $DIR && docker-compose ps -q php) bash -ic "$*"
fi

# Return to the cwd.
cd $CWD
