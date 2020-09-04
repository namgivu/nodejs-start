#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # SH aka SCRIPT_HOME=executed script's path, containing folder
AH=`cd "$SH/.." && pwd`  # AH aka APP_HOME
    source $SH/.config.sh
    cd $AH
        c=$CONTAINER_NAME ; docker stop -t1 $c ; docker rm -f $c
