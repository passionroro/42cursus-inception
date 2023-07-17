FROM debian:10.13
 
RUN apt-get update && \
    apt-get install -y curl php7.3 php-fpm php-mysql mariadb-client

RUN cd /tmp && \
    curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp
    
RUN wp core download --path=/var/www/wordpress

COPY ./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./tools/entrypoint.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
