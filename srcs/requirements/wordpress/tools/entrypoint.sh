#!/bin/bash

set -e

sleep 15

#CONTAINER=mariadb
#while [ "$(docker inspect --format='{{ .State.Running }}' "$CONTAINER" 2>/dev/null)" != "true" ]; do
#  echo "$CONTAINER is not running. Sleep for 1 second"
#  sleep 1
#done
#echo "$CONTAINER is now running. Running wordpress installation..."

if [ ! -e /var/www/html/wp-config.php ]; then
	echo -n "wp: wp-config.php creation... "
	wp config create --dbname="$MARIADB_DATABASE" --dbuser="$MARIADB_USER" --dbpass="$MARIADB_USER_PWD" --dbhost="$MARIADB_HOST" \
	--path='/var/www/html' --allow-root
	echo "done."

	echo -n "wp: wordpress installation... "
	wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PWD" \
	--admin_email="$ADMIN_EMAIL" --allow-root --path='/var/www/html'
	echo "done."

	echo -n "wp: user creation... "
	wp user create "$USER_LOGIN" "$USER_MAIL" --user_pass="$USER_PASS" --allow-root --path='/var/www/html'
	echo "done."

	echo -n "wp: post creation... "
	wp theme install twentytwentythree --path=/var/www/html --activate --allow-root
	wp post create --post_type=post --post_title="$WP_TITLE" --allow-root
	echo "done."
fi

echo "Wordpress setup complete."

/usr/sbin/php-fpm7.3 -F
