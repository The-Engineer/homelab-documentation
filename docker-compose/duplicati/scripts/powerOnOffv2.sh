#!/bin/bash

# read env vars
EVENTNAME=$DUPLICATI__EVENTNAME # can be BEFORE or AFTER
LOCALPATH=$DUPLICATI__LOCALPATH # local folder path of dir to backup (INSIDE container)

# determine if step is run before or after backup
case $EVENTNAME in
    BEFORE)
        OPERATION="stop";;
    AFTER)
        OPERATION="start";;
    *) exit 1;;
esac

case $LOCALPATH in
    /Container_docker-data/docker-portainer/)
        CONTAINER="portainer";;
    /Container_docker-data/docker-proxymanager/)
        CONTAINER="npm-app npm-mariadb npm-goaccess";;
    /Container_docker-data/docker-wg-easy/)
        CONTAINER="wg-easy";;
    /Container_docker-data/docker-gotify/)
        CONTAINER="gotify";;
    /Container_docker-data/docker-grafana/)
        CONTAINER="grafana";;
    /Container_docker-data/docker-heimdall/)
        CONTAINER="heimdall";;
    /Container_docker-data/docker-homepage/)
        CONTAINER="homepage";;
    /Container_docker-data/docker-influxdb/)
        CONTAINER="influxdb";;
    /Container_docker-data/docker-obsidian/)
        CONTAINER="obsidian-remote";;
    /Container_docker-data/docker-paperless/)
        CONTAINER="paperless-app paperless-db paperless-broker";;
    /Container_docker-data/docker-plex/)
        CONTAINER="plex-app";;
    /Container_docker-data/docker-pyload/)
        CONTAINER="pyload";;
    /Container_docker-data/docker-uptimekuma/)
        CONTAINER="uptime-kuma";;
    /Container_docker-data/docker-tandoor/)
        CONTAINER="recipes_app recipes_postgres";;
    /Container_docker-data/docker-tautulli/)
        CONTAINER="tautulli";;
    /Container_docker-data/docker-shlink/)
        CONTAINER="shlink-database shlink-backend shlink-gui";;
    /Container_docker-data/docker-vaultwarden/)
        CONTAINER="vaultwarden";;
    /Container_docker-data/docker-gitlab/)
        CONTAINER="gitlab-ce gitlab-runner";;
    *) exit 1;;
esac

# DEBUG
# env >> /scripts/tmp.log

echo "running cmd: [docker $OPERATION $CONTAINER]"
docker $OPERATION $CONTAINER

exit 0
