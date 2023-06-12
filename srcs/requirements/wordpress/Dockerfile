FROM debian:10.13

RUN apt-get update && \
    apt-get install -y php-fpm php-mysql curl

RUN curl -o /tmp/wordpress.tar.gz -SL https://wordpress.org/latest.tar.gz && \
    tar -xzf /tmp/wordpress.tar.gz

COPY wp-config.php /var/www/html/wp-config.php
#COPY php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
#COPY wordpress.conf /etc/php/7.3/fpm/pool.d/wordpress.conf

WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

USER www-data

EXPOSE 9000

CMD ["php-fpm7", "F"]
