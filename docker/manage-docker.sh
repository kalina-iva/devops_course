#!/bin/bash

case $1 in
create)
  docker build -t test-nginx . &&
    docker run -d \
      --name nginx-kalina \
      -p 8080:80 \
      test-nginx
  ;;
start)
  docker run -d \
    --name nginx-kalina \
    -p 8080:80 \
    test-nginx
  ;;
stop)
  docker stop nginx-kalina
  ;;
destroy) ;;

esac
