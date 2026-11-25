#!/usr/bin/env bash

docker compose down

if [[ "$1" == "-t" || "$2" == "-t" ]]; then
    curl -fsSLO https://raw.githubusercontent.com/searxng/searxng/master/container/docker-compose.yml https://raw.githubusercontent.com/searxng/searxng/master/container/.env.example
    rm .env
    mv .env.example .env
fi


if [[ "$1" == "-a" || "$2" == "-a" ]]; then
    docker system prune -a
fi

docker compose pull
docker compose up -d
