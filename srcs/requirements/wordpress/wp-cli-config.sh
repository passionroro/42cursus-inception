#!/bin/sh

echo "wordpress download: "
wp core download --path=/var/www/wordpress --version=6.1.1 --allow-root

echo "wp-config.php configuration: "
wp core config \
    --path=/var/www/wordpress \
    --dbname="$MARIADB_DB" \
    --dbuser="$MARIADB_USER" \
    --dbpass="$MARIADB_PWD" \
    --allow-root

echo "wordpress install / create admin user"
wp core install \
    --path=/var/www/wordpress \
    --url="$WP_URL" \
    --title="$WP_TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PWD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --allow-root

echo "create new user"
wp user create "$WP_USER" "$WP_USER_EMAIL" --user_pass="$WP_USER_PWD" --allow-root

echo "quick theme and post"
wp theme install twentytwentythree --path=/var/www/wordpress --activate --allow-root
wp post create --post_type=post --post_title="$WP_TITLE" --allow-root

echo "run php-fpm"
php-fpm7 --nodaemonize

