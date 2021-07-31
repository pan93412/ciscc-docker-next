#!/usr/bin/env bash
# -*- coding: utf-8 -*-

pull_repo() {
    git pull
}

pull_images() {
    docker-compose pull
}

regenerate_strapi() {
    docker run --entrypoint "bash" -v "$(pwd)/app:/app" -c "cd /app && yarn && NODE_ENV=production yarn build"
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
