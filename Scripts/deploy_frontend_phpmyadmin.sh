#!/bin/bash

set -ex

source .env

apt install wget -y

mkdir -p /var/www/html/adminer

wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php -P /var/www/html/adminer

mv /var/www/html/adminer/adminer-4.8.1-mysql.php /var/www/html/adminer/index.php

chown -R www-data:www-data /var/www/html

openssl req \
 -x509 \
 -nodes \
 -days 365 \
 -newkey rsa:2048 \
 -keyout /etc/ssl/private/apache-selfsigned.key \
 -out /etc/ssl/certs/apache-selfsigned.crt \
 -subj "/C=$openssl_country/ST=$openss_province/L=$openssl_locality/O=$openssl_organization/OU=$openssl_orgunit/CN=$openssl_common_name/emailAddress=$openssl_email"

cp ../conf/default-ssl.conf /etc/apache2/sites-available/

sed -i "s/DOMAIN_HERE/$openssl_common_name/" /etc/apache2/sites-available/default-ssl.conf

a2ensite default-ssl.conf

a2enmod ssl

cp ../conf/000-default.conf /etc/apache2/sites-available

a2enmod rewrite

systemctl restart apache2