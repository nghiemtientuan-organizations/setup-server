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
wait
source ./core/base.sh
wait

#----- FUNCTION Install SSH Server -----#
read -p '[Question] SSH Server (y/n)?' sshServer_answer
case ${sshServer_answer:0:1} in
    y|Y|yes|YES|Yes )
        source ./core/sshServer.sh
        wait
        source ./core/generateSSHKey.sh
        wait
    ;;
esac

#----- FUNCTION Generate SSH Key -----#
source ./core/generateSSHKey.sh
wait

#----- FUNCTION Install docker and docker-compose -----#
read -p '[Question] Install docker & docker-compose (y/n)?' docker_answer
case ${docker_answer:0:1} in
    y|Y|yes|YES|Yes )
        source ./core/docker.sh
        wait
    ;;
esac

#----- FUNCTION Install php -----#
read -p '[Question] Install php (y/n)?' php_answer
case ${php_answer:0:1} in
    y|Y|yes|YES|Yes )
        source ./core/php.sh
        wait
    ;;
esac

#----- FUNCTION Install composer -----#
read -p '[Question] Install composer (y/n)?' composer_answer
case ${composer_answer:0:1} in
    y|Y|yes|YES|Yes )
        source ./core/compose.sh
        wait
    ;;
esac

#----- FUNCTION Install mysql -----#
read -p '[Question] Install mysql (y/n)?' mysql_answer
case ${mysql_answer:0:1} in
    y|Y|yes|YES|Yes )
        source ./core/mysql.sh
        wait
    ;;
esac

#----- FUNCTION Install nodejs -----#
read -p '[Question] Install nodejs (y/n)?' nodejs_answer
case ${nodejs_answer:0:1} in
    y|Y|yes|YES|Yes )
        source ./core/nodejs.sh
        wait
    ;;
esac

#----- FUNCTION Install Nginx -----#
read -p '[Question] Install nginx (y/n)?' nginx_answer
case ${nginx_answer:0:1} in
    y|Y|yes|YES|Yes )
        source ./core/nginx.sh
        wait
    ;;
esac

#----- FUNCTION Install Apache2 -----#
read -p '[Question] Install apache (y/n)?' apache_answer
case ${apache_answer:0:1} in
    y|Y|yes|YES|Yes )
        source ./core/apache.sh
        wait
    ;;
esac

#----- FUNCTION Install deployer -----#
read -p '[Question] Install deployer (y/n)?' deployer_answer
case ${deployer_answer:0:1} in
    y|Y|yes|YES|Yes )
        source ./core/deployer.sh
        wait
    ;;
esac
