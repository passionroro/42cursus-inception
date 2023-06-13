#!/bin/bash

echo "WordPress installation..."

wp core download --path=/var/www/wordpress --version=6.1.1 --allow-root

wp core config \
    --path=/var/www/wordpress \
    --dbname="$MARIADB_DB" \
    --dbuser="$MARIADB_USER" \
    --dbpass="$MARIADB_PWD" \
    --allow-root

wp core install \
    --path=/var/www/wordpress \
    --url="$WP_URL" \
    --title="$WP_TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PWD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --allow-root

wp user create "$WP_USER" "$WP_USER_EMAIL" --user_pass="$WP_USER_PWD" --allow-root

wp theme install twentytwentythree --path=/var/www/wordpress --activate --allow-root

wp post create --post_type=post --post_title="$WP_TITLE" --allow-root

php-fpm7 --nodaemonize

