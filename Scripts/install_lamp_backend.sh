#!/bin/bash

set -ex

apt update

#apt upgrade -y

source .env

apt-get install mysql-server -y

sed -i "s/127.0.0.1/$moodle_db_host/" /etc/mysql/mysql.conf.d/mysqld.cnf

systemctl restart mysql

sudo mysql -u root <<< "DROP USER IF EXISTS '$moodle_db_user'@'$moodle_db_host';"
sudo mysql -u root <<< "CREATE USER '$moodle_db_user'@'%' IDENTIFIED BY '$moodle_db_pass';"
sudo mysql -u root <<< "GRANT ALL PRIVILEGES ON \`$moodle_db_name\`.* TO '$moodle_db_user'@'%';"
sudo mysql -u root <<< "FLUSH PRIVILEGES;"