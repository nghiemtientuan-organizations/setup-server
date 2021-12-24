#!/bin/bash
echo '#---------------------------------------------------#'
echo '#  Start  #'
echo '#---------------------------------------------------#'
#----- If command error, exit now -----#
set -e
#----- Check permission -----#
if [ $EUID != 0 ]; then
    echo "[Notify] Please run this script as root (sudo source index.sh)!"
    exit 1
fi

#----- FUNCTION install with ubuntu version -----#
function runInUbuntuVersion() {
    ubuntuVersion=$(lsb_release -rs)
    if [[ $ubuntuVersion == "18."* ]]; then
      source ./ubuntu18.sh
    elif [[ $ubuntuVersion == "20."* ]]; then
      source ./ubuntu20.sh
    else
      echo [Error] Non-compatible ubuntu support version
      exit 1
    fi
}

#----- MAIN Check ubuntu -----#
echo '#---------------------------------------------------#'
echo '#  Ubuntu  #'
echo '#---------------------------------------------------#'
if [[ $(lsb_release -d) == *"Ubuntu"* ]]; then
    echo [Notify] Compatible ubuntu

    runInUbuntuVersion
else
    echo [Error] Non-compatible ubuntu
    exit 1
fi
