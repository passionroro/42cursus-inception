FROM debian:10.13

RUN apt-get update && \
    apt-get install -y mariadb-server

RUN mkdir -p /var/www/mysql && \
    chown -R mysql:mysql /var/www/mysql && \
    chmod 755 /var/www/mysql

COPY db_create.sql /usr/local/bin

RUN chmod +x /usr/local/bin/db_create.sql

COPY entrypoint.sh /usr/local/bin

RUN chmod +x /usr/local/bin/entrypoint.sh

USER mysql

ENTRYPOINT ["tail", "-f", "/dev/null"]
#ENTRYPOINT ["/bin/sh", "-c", "/usr/local/bin/entrypoint.sh"]
