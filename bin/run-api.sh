#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`  # SH aka SCRIPT_HOME=executed script's path, containing folder
AH=`cd "$SH/.." && pwd`  # AH aka APP_HOME

if [[ -z $PORT ]]; then PORT=3000; fi

cd $AH
    PORT="$PORT"  PATH="$AH/node_modules/.bin:$PATH" nodemon src/api.js
    # api port    add to PATH node_module/.bin
    # .           ref. https://cutt.ly/ofnm9Of
