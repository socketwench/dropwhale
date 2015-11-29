#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

PS=$(cd $DIR && docker-compose ps -q)

if [[ $PS == '' ]]; then
	echo "Starting containers..."
	$(cd $DIR && docker-compose up -d)
fi

${DIR}/bash.sh /root/scripts/rebuild.sh