#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # SH aka SCRIPT_HOME=executed script's path, containing folder
AH=`cd "$SH/../.." && pwd`  # AH aka APP_HOME
    source "$AH/docker/db/.config.sh"

    # run seeding.sh
    docker exec  $CONTAINER_NAME  psql -U$DB_USER postgres -c "drop   database \"$DB_NAME\" "
    docker exec  $CONTAINER_NAME  psql -U$DB_USER postgres -c "create database \"$DB_NAME\" "
    #            .                .    .            .
        sql="$SH/schema.sql"
        docker exec -i $CONTAINER_NAME  psql -U$DB_USER  $DB_NAME < $sql  #NOTE must have -i exec
        docker exec $CONTAINER_NAME psql -U$DB_USER  $DB_NAME -c '\dt'

# aftermath
echo "
--- ---
COMMAND HINT
    docker exec $CONTAINER_NAME psql -U$DB_USER  $DB_NAME -c '\dt'

    psql postgresql://$DB_USER:$DB_PASS@:$PORT/$DB_NAME -c '\dt'
"