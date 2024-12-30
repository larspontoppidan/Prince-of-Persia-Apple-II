#!/usr/bin/bash

set -e

echo Docker.io and buildx must be installed in order to build the docker image:
echo 
echo "  sudo apt install docker.io docker-buildx"
echo
echo Make sure the current user is in the docker group, if not:
echo
echo "  sudo groupadd docker"
echo "  sudo usermod -aG docker $USER"
echo "  newgrp docker"
echo

IMAGE_NAME=pop-build
HOST_UID=$(id -u)
HOST_GID=$(id -g)

echo The docker image will create build artifacts as the current user, with has:
echo
echo "  UID:$HOST_UID, GID:$HOST_GID"
echo

read -p "Press enter to continue"

docker buildx build --build-arg UID=$HOST_UID --build-arg GID=$HOST_GID --load -t $IMAGE_NAME .

echo
echo Docker image: $IMAGE_NAME created

