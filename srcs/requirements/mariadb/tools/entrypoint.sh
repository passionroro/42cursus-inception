#!/bin/bash

set -e

if [ $(service mysql status >/dev/null 2>&1; echo $?) -eq 3 ]; then
	rm -R /var/lib/mysql/*
	mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
	service mysql start
fi

echo "mariadb: mysql_secure_installation..."
/bin/bash /usr/local/bin/mysql_secure.sh
echo "done."

echo -n "mariadb: database and user setup..."
mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"
echo "done."

echo "/*-------------*\\"
mysql -e "SELECT User,Host FROM mysql.user;"
echo "\\*-------------*/"

echo "mariadb: shutdown..."
mysqladmin shutdown

echo "mariadb: starting server (safe)..."
exec mysqld_safe

echo "|-- MariaDB setup complete ! --|"
