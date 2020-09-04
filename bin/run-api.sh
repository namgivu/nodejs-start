#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # SH aka SCRIPT_HOME=executed script's path, containing folder
# shellcheck disable=SC2006
AH=`cd "$SH/.." && pwd`  # AH aka APP_HOME

if [[ -z $PORT ]]; then PORT=3000; fi

cd $AH
    PORT="$PORT" nodemon src/server.js
