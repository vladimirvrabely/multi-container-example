set shell := ["fish", "-c"]

default:
        @just --list

# Docker compose up
up compose:
        docker compose --file docker/compose.{{compose}}.yml --env-file docker/.env up --detach --wait

# Docker compose down
down compose:
        docker compose --file docker/compose.{{compose}}.yml down
