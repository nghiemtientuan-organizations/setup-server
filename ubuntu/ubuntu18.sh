#!/bin/bash

echo ''
echo '#---------------------------------------------------#'
echo '#  Check ubuntu support version  #'
echo '#---------------------------------------------------#'
echo [Notify] Ubuntu version: $(lsb_release -rs)
if [[ $(lsb_release -rs) == "18."* ]]; then
    echo [Notify] Compatible ubuntu version
else
    echo [Error] Non-compatible ubuntu version
    exit 1
fi

#----- FUNCTION Install window dependency -----#
source ./core/updateWindow.sh
source ./core/base.sh
echo [Notify] Install window dependency success

#read -p '[Question] Install docker & docker-compose (y/n)?' docker_answer
#case ${docker_answer:0:1} in
#    y|Y|yes|YES|Yes )
#        echo '[Noti] Install docker & docker-compose ...'
#    ;;
#esac

#if [ $1 ]
#then
#  deploy_branch=$1
#fi
#
#if [ $2 ]
#then
#  project_name=$2
#fi
#
#echo [Noti] Deploying...
#if cd "$project_folder$project_name"; then
#  git reset --hard HEAD
#  git fetch origin $deploy_branch
#  echo [Noti] Checkout $deploy_branch
#  if git checkout $deploy_branch; then
#    git pull origin $deploy_branch
#
#    echo [Noti] Install dependency
#    composer install
#    composer dump-autoload
#
#    echo [Noti] Migrate database
#    php artisan migrate
#    php artisan optimize:clear
#    npm install
#    npm run prod
#
#    cd -
#
#    echo [Noti] Deploy success!
#  else
#    echo [Noti] Checkout $deploy_branch failed!
#    cd -
#    echo [Noti] Deploy Failed!
#  fi
#else
#  echo [Noti] Checkout $project_name failed!
#  echo [Noti] Deploy Failed!
#fi
