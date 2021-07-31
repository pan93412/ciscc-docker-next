#!/usr/bin/env bash
# -*- coding: utf-8 -*-

pull_repo() {
    git pull
}

pull_images() {
    docker-compose pull
}

recreate_containers() {
    docker-compose down && docker-compose up -d
}

pull_repo && pull_images && recreate_containers
