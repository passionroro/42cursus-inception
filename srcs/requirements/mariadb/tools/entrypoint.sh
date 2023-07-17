#!/bin/bash

service mysql start;

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MARIADB_USER}\`@'localhost' IDENTIFIED BY '${MARIADB_PWD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DB}\`.* TO \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PWD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PWD}';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$MARIADB_ROOT_PWD shutdown

exec mysqld_safe
