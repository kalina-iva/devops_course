#!/bin/bash

ACTION=$1
PORT="${2:-80}"
IMAGE="nginx-kalina"
CONTAINER="nginx-container-kalina"

case $ACTION in
create)
  echo 'creating...'
  docker build -t $IMAGE . &&
    docker run -d \
      --name $CONTAINER \
      -p $PORT:80 \
      $IMAGE
  ;;
start)
  echo 'starting...'
  docker start $CONTAINER
  ;;
stop)
  echo 'stopping...'
  docker stop $CONTAINER
  ;;
destroy)
  echo 'destroying'
  docker stop $CONTAINER &&
    docker rm $CONTAINER &&
    docker rmi $IMAGE
  ;;
*)
  echo 'what should I do? example, ./manage-docker.sh start'
  ;;
esac
