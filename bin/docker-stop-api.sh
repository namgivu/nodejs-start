#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # SH aka SCRIPT_HOME=executed script's path, containing folder
AH=`cd "$SH/.." && pwd`  # AH aka APP_HOME

cd "$APP_HOME"
    # stop the container ie stop the api app
    cn='nn_nodejs_start'; docker stop $cn && docker rm $cn  # cn aka CONTAINER_NAME
cd -
