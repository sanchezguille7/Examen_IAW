#!/bin/bash

set -ex

apt update

#apt upgrade -y

source .env

apt install apache2 -y

apt install php libapache2-mod-php php-mysql php-xml php-mbstring php-curl php-zip php-gd php-intl php-soap -y

cp ../conf/000-default.conf /etc/apache2/sites-available

a2enmod rewrite

systemctl restart apache2

cp ../php/index.php /var/www/html

chown -R www-data:www-data /var/www/html