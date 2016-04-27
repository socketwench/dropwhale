#!/usr/bin/env bash

echo "This will delete ALL CONTAINERS AND IMAGES from you system!"
read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

echo "Killing all containers..."
docker kill $(docker ps -q)

echo "Deleting all containers..."
docker rm $(docker ps -qa)

echo "Deleting all images..."
docker rmi $(docker images -q)
