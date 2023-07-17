#!/bin/bash
if [ ! -e /var/www/wordpress/wp-config.php ]; then
	wp config create --dbname=$MARIADB_DB --dbuser=$MARIADB_USER --dbpass=$MARIADB_PWD --dbhost=$MARIADB_HOST \ 
		--path='/var/www/wordpress' --allow-root
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PWD \ 
		--admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/wordpress'
	wp user create $USER_LOGIN $USER_MAIL --user_pass=$USER_PASS --allow-root --path='/var/www/wordpress'
fi

/usr/sbin/php-fpm7.3 -F
