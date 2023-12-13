#!/bin/bash

set -ex

apt update

#apt upgrade -y

source .env

apt install apache2 -y
 
cp ../conf/000-default.conf /etc/apache2/sites-available/000-default.conf

sudo apt install php php-mysql libapache2-mod-php php-xml php-mbstring php-curl php-zip php-gd php-intl php-soap -y

systemctl restart apache2

