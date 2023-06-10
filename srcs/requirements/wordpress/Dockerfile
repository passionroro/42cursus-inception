FROM debian:10.13

RUN apt-get update && \
    apt-get install -y php-fpm curl

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf

WORKDIR /var/www/html

RUN curl -o wordpress.tar.gz -SL https://wordpress.org/latest.tar.gz && \
    tar -xzf wordpress.tar.gz --strip-components=1 && \
    rm wordpress.tar.gz

RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

USER www-data

EXPOSE 9000

#CMD ["php-fpm", "F"]
