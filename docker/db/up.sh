#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # SH aka SCRIPT_HOME=executed script's path, containing folder
    source "$SH/.config.sh"

    # prepare postgres infra aka wire up container ref. https://github.com/namgivu/postgres-start/blob/master/backup-db/00b.prepare-infra.sh
    #                postgres container customized ref. https://hub.docker.com/_/postgres?tab=description
    docker stop -t1 $CONTAINER_NAME ; docker rm -f $CONTAINER_NAME
    docker run -d \
        --name $CONTAINER_NAME \
        -p $DB_PORT:5432 \
        -e     POSTGRES_USER=$DB_USER \
        -e POSTGRES_PASSWORD=$DB_PASS \
        -e       POSTGRES_DB=$DB_NAME \
        $IMAGE_TAG
