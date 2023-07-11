#!/bin/sh

mysql_install_db

/etc/init.d/mysql start

# Notes: secure_installation may require root password not encrypted
# mariadb container doesn't have env variables 

if [ -d "/var/lib/mysql/$MARIADB_DB" ]; then
	echo "Database "${MARIADB_DB}" already exists."
else
	/usr/bin/mysql_secure_installation << EOF

Y
$MARIADB_ROOT_PWD
$MARIADB_ROOT_PWD
Y
n
Y
Y
EOF
	
	mysql -uroot -p$MARIADB_ROOT_PWD $MARIADB_DB < /usr/local/bin/db_create.sql
fi

/etc/init.d/mysql stop

#You can start the MariaDB daemon with:
#cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'  

mysqld
