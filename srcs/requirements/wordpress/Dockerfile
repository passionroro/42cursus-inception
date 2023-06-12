FROM debian:10.13

RUN apt-get update && \
    apt-get install -y php-fpm php-mysql curl

RUN mkdir -p /var/www

RUN curl -o /tmp/wordpress.tar.gz -SL https://wordpress.org/latest.tar.gz && \
    tar -xzf /tmp/wordpress.tar.gz -C /var/www

COPY wp-config.php /var/www/wordpress/wp-config.php
#COPY php-fpm.conf /etc/php/7.3/fpm/hp-fpm.conf
#COPY wordpress.conf /etc/php/7.3/fpm/pool.d/wordpress.conf

WORKDIR /var/www/wordpress

RUN chown -R www-data:www-data /var/www/wordpress && \
    chmod -R 755 /var/www/wordpress

USER www-data

EXPOSE 9000

ENTRYPOINT ["tail", "-f", "/dev/null"]
#CMD ["php-fpm7", "F"]
