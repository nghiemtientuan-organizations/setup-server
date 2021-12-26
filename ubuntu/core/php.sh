#!/bin/bash
php_version='8.0'

echo ''
echo '#---------------------------------------------------#'
echo '#  Install PHP  #'
echo '#---------------------------------------------------#'
while true;
do
    read -p '[Question] PHP Version (8.0|7.4|7.3)?' php_version_input
    case ${php_version_input} in
        8|8.|8.0 )
            php_version='8.0'
            break
        ;;
        7|7.|7.4 )
            php_version='7.4'
            break
        ;;
        7.3 )
            php_version='7.3'
            break
        ;;
        * )
          echo '[Notify] Please enter php version (support install 8.0|7.4|7.3 version)'
        ;;
    esac
done

sudo apt-get update
sudo apt -y install software-properties-common apt-transport-https ca-certificates lsb-release
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt -y install php${php_version}

#----- Install php extension -----#
sudo apt-get install -y build-essential libpq-dev
sudo apt-get install -y php${php_version}-{xml,xsl,fpm,bcmath,curl,http,raphf,propro,bz2,intl,gd,mbstring,mysql,zip,common,imagick,json,cli,pear,sqlite3}

#----- Change PHP default version -----#
sudo update-alternatives --set php /usr/bin/php${php_version}

echo [Notify] $(php -v)
echo [Notify][Success] PHP
