#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # SH aka SCRIPT_HOME=executed script's path, containing folder
AH=`cd "$SH/.." && pwd`  # AH aka APP_HOME

cd "$APP_HOME"
    # stop if any running container exists
    c=nn_nodejs_start; docker stop $c; docker rm $c

    # load custom mapped exposed-port if nay - default 3000 if not specified
    if [[ -z $PORT ]]; then PORT=3000; fi
    # run it
    docker run  --name nn_nodejs_start  -d                             -p $PORT:3000  namgivu/nodejs_start
                #container name         #run as daemon aka background  #port mapping  #image name
cd --


# aftermath check
echo
docker ps | grep -E 'nodejs_start|IMAGE'
echo "
Container log can be viewed by (press ^C to exit watch)
watch docker logs nn_nodejs_start

The api is ready to serve when we can see 'api server started at port=3000'
"
