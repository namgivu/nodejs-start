#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # SH aka SCRIPT_HOME=executed script's path, containing folder
AH=`cd "$SH/../.." && pwd`  # AH aka APP_HOME
    source "$SH/.config.sh"

    cd $AH
        # build the docker image for this api app i.e. local image namgivu/falcon_start
        docker build --file "$SH/Dockerfile"  -t $IMAGE_TAG   .
        #            custom dockerfile        image tag       build from :AH app home

            # aftermath check
            echo
            docker image ls | grep -iE "$IMAGE_TAG|REPOSITORY" --color=always
