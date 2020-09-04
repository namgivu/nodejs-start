#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # SH aka SCRIPT_HOME=executed script's path, containing folder
AH=`cd "$SH/.." && pwd`  # AH aka APP_HOME

cd "$APP_HOME"
    # build the docker image for this api app i.e. local image namgivu/falcon_start
    docker build -t namgivu/nodejs_start   .
                 #t aka tag of the image   #build image from :current_folder/Dockerfile
cd --

# aftermath check
echo
docker image ls | grep -iE 'namgivu/nodejs_start|REPOSITORY'
