#!/usr/bin/env bash
s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME="$s"  # get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
a="$SCRIPT_HOME/.." ;                a=$(cd "$a" && pwd) ; APP_HOME="$a"

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
