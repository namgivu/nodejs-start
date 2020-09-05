#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # SH aka SCRIPT_HOME=executed script's path, containing folder
AH=`cd "$SH/.." && pwd`  # AH aka APP_HOME

    source "$AH/docker/db/.config.sh"

        echo '--- ---'
        echo 'ensure container is up by grepping the its log'
            l=`docker logs $CONTAINER_NAME 2>&1`; echo $l | grep -o "database system is ready to accept connections"
                ec=$? && echo $ec; db_is_serving=$ec

        echo '--- ---'
        echo 'ensure postgres connectivity'
            docker exec $CONTAINER_NAME  psql "postgresql://$DB_USER:$DB_PASS@:/$DB_NAME" -c '\dt'  #NOTE no DB_PORT here cause within the container, port is still 5432
                ec=$? && echo $ec; container_connectivity=$ec
            pg_isready -U $DB_USER -h localhost -p $DB_PORT -d $DB_NAME  # ref. https://stackoverflow.com/a/44496546/248616
                ec=$? && echo $ec; direct_connectivity=$ec
echo "
--- ---
SUMMARY
               check item = error status
            db_is_serving = $db_is_serving
   container_connectivity = $container_connectivity
      direct_connectivity = $direct_connectivity
"
