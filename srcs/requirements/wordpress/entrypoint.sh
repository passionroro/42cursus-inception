#!/bin/sh

if [ -f ./wp-config-sample.php ]; then
	echo "Wordpress is already installed."
else
	echo "wordpress download: "
	wp core download --path=/var/www/wordpress --version=6.1.1 --allow-root

#	echo "\nwp-config.php creation: "
#	wp config create \
#	    --path=/var/www/wordpress \
#	    --dbname="$MARIADB_DB" \
#	    --dbhost="$MARIADB_HOST" \
#	    --dbuser="$MARIADB_USER" \
#	    --dbpass="$MARIADB_PWD" \
#	    --allow-root

	echo "\nwordpress install / create admin user"
	wp core install \
	    --path=/var/www/wordpress \
	    --url="$WP_URL" \
	    --title="$WP_TITLE" \
	    --admin_user="$WP_ADMIN_USER" \
	    --admin_password="$WP_ADMIN_PWD" \
	    --admin_email="$WP_ADMIN_EMAIL" \
	    --allow-root

	echo "\ncreate new user"
	wp user create "$WP_USER" "$WP_USER_EMAIL" --user_pass="$WP_USER_PWD" --allow-root

	echo "\nquick theme and post"
	wp theme install twentytwentythree --path=/var/www/wordpress --activate --allow-root
	wp post create --post_type=post --post_title="$WP_TITLE" --allow-root
	rm -f ./wp-config-sample.php
fi

/usr/sbin/php-fpm7.3 -F
