#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # SH aka SCRIPT_HOME=executed script's path, containing folder
AH=`cd "$SH/.." && pwd`  # AH aka APP_HOME

    source "$AH/docker/.config.sh"

        # ensure container is up by grepping the its log
        l=`docker logs $CONTAINER_NAME 2>&1`; echo $l; echo $l | grep "api server started at port=3000"
            api_is_serving=$?

        # ensure port matched with :PORT set in .config.sh
        g=`docker ps --format '{{.Names}} {{.Ports}}' | grep $CONTAINER_NAME` ; echo $g | grep -o ":$PORT->3000"
            correct_port=$?


echo "
--- ---
SUMMARY
      check item = error status
  api_is_serving = $api_is_serving
    correct_port = $correct_port
"
