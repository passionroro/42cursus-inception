#!/bin/bash

set -e

if [ $(service mysql status >/dev/null 2>&1; echo $?) -eq 3 ]; then
#	if [ -z "$(ls -A /var/lib/mysql)" ]; then
#		rm -R /var/lib/mysql/*
#	fi
#	mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
	service mysql start
	echo -n "mariadb: mysql_secure_installation..."
	/bin/bash /usr/local/bin/mysql_secure.sh
	echo "done."
#	echo -e "\rn\rY\rY\rY\rY\r" | mysql_secure_installation
fi

echo -n "mariadb: database setup..."
mysql -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"
mysql -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_USER_PWD';"
mysql -e "GRANT ALL ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"
echo "done."

echo "mariadb: restarting..."
mysqladmin shutdown

echo "MariaDB setup complete."
exec mysqld_safe
