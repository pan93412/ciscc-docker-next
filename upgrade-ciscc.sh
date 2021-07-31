#!/usr/bin/env bash
# -*- coding: utf-8 -*-

pull_repo() {
    git pull
}

pull_images() {
    docker-compose pull
}

regenerate_strapi() {
    container=$(docker run --entrypoint "bash" -v "$(pwd)/app:/app" node:14)

    docker exec "$container" cd /app
    docker exec "$container" export NODE_ENV=production
    docker exec "$container" yarn && yarn build

    docker container stop "$container"
    docker container rm "$container"
}

recreate_containers() {
    docker-compose down && docker-compose up -d
}

pull_all() {
    pull_repo && pull_images
}

quick_upgrade_ciscc() {
    pull_all && recreate_containers
}

full_upgrade_ciscc() {
    pull_all && regenerate_strapi && recreate_containers
}
