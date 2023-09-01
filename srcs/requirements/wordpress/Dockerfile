FROM debian:10.13

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y vim curl php-fpm php7.3

RUN apt-get install -y mariadb-server

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html && \
    chown -R root:root /var/www/html && \
    chmod 755 /var/www/html

RUN wp core download --path=/var/www/html --allow-root

COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

#ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
