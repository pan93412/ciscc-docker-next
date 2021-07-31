#!/usr/bin/env bash
# -*- coding: utf-8 -*-

declare -A envfile=(
    [".strapi.env.example"]="https://github.com/pan93412/ciscc-strapi/blob/master/.env.example?raw=true"
    [".backend.env.example"]="https://github.com/pan93412/ciscc-backend-next/blob/master/.env.example?raw=true"
)

for i in "${!envfile[@]}"; do
    curl -Lo "$i" "${envfile[$i]}"
done