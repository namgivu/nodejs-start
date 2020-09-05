#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # SH aka SCRIPT_HOME=executed script's path, containing folder
AH=`cd "$SH/.." && pwd`  # AH aka APP_HOME

    source "$AH/docker/api/.config.sh"

        echo '--- ---'
        echo 'ensure container is up by grepping the its log'
            l=`docker logs $CONTAINER_NAME 2>&1`; echo $l | grep -o "api server started at port=3000"
                ec=$? && echo $ec; api_is_serving=$ec

        echo '--- ---'
        echo 'ensure port matched with :PORT set in .config.sh'
            g=`docker ps --format '{{.Names}} {{.Ports}}' | grep $CONTAINER_NAME` ; echo $g | grep -o ":$PORT->3000"
                ec=$? && echo $ec; correct_port=$ec

        echo '--- ---'
        echo 'ensure can call endpoint /hello'
            n=HEALTHCHECK ; curl "localhost:$PORT/hello/$n"  # n aka name
                ec=$? && echo $ec; endpoint_hello=$ec

echo "
--- ---
SUMMARY
      check item = error status
  api_is_serving = $api_is_serving
    correct_port = $correct_port
  endpoint_hello = $endpoint_hello
"
