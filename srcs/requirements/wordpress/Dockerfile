FROM debian:10.13

RUN apt-get update -y && \
    apt-get upgrade -y

RUN apt-get install -y mariadb-server vim curl php-fpm php7.3 php-mysql sendmail

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    chown root:root wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp-cli.phar

RUN mkdir -p /var/www/html && \
    chown -R root:root /var/www/html && \
    chmod 755 /var/www/html

RUN wp-cli.phar cli update --allow-root

RUN wp-cli.phar core download --path=/var/www/html --allow-root

RUN mkdir /run/php/
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

COPY ./tools/content.txt /tmp/content.txt

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
