#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # SH aka SCRIPT_HOME=executed script's path, containing folder
AH=`cd "$SH/.." && pwd`  # AH aka APP_HOME
    source "$SH/.config.sh"

    cd $AH
        # stop if any running container exists
        c=$CONTAINER_NAME; docker stop -t1 $c; docker rm -f $c

        # load custom mapped exposed-port if nay - default 3000 if not specified
        if [[ -z $PORT ]]; then PORT=3000; fi

        set -e  # halt if error ON
            # run api
            docker run  --name $CONTAINER_NAME  -d              -p $PORT:3000  $IMAGE_TAG
            #            .                      run as daemon   .              .
        set +e  # halt if error OFF

            # aftermath check
            echo
            docker ps | grep -E "$CONTAINER_NAME|IMAGE" --color=always
            
            echo "
View container log
    watch docker logs $CONTAINER_NAME  # api online when 'api server started at port=3000'
Sample endpoint request
    http :3000/hello
    http :3000/hello/nn
    curl localhost:3000/hello
    curl localhost:3000/hello/nn
"
