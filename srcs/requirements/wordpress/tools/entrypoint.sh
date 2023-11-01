#!/bin/bash

set -e

sleep 15

until mysqladmin ping -h "mariadb" --silent; do
	echo "Waiting for MariaDB to be ready..."
	sleep 1
done
echo "|-- Starting Wordpress setup. --|"

rm -f /var/www/html/wp-config.php
wp-cli.phar config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASSWORD" --dbhost=mariadb:3306 --path='/var/www/html' --allow-root

if ! wp-cli.phar core is-installed --path='/var/www/html' --allow-root; then
	wp-cli.phar core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PWD" --admin_email="$ADMIN_EMAIL" --allow-root --path='/var/www/html'
fi

if ! wp-cli.phar user list --field=user_login --path='/var/www/html' --allow-root | grep -q "$USER_LOGIN"; then
	wp-cli.phar user create "$USER_LOGIN" "$USER_EMAIL" --user_pass="$USER_PASS" --allow-root --path='/var/www/html'
fi

POST_TITLE="L’impérialisme suisse ou les secrets d’une puissance invisible"
if ! wp-cli.phar post list --allow-root --path='/var/www/html' --field=post_title | grep -q "$POST_TITLE"; then
	wp-cli.phar post create /tmp/content.txt --post_title="$POST_TITLE" --post_status=publish --allow-root --path=/var/www/html --post_author="Sébastien Guex"
fi

echo "|-- Wordpress setup complete! --|"

wp-cli.phar user list --path='/var/www/html' --allow-root

/usr/sbin/php-fpm7.3 -F
