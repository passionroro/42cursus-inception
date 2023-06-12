FROM debian:10.13

RUN apt-get update && \
    apt-get install -y mariadb-server

RUN mkdir -p /var/www/mysql && \
    chown -R mysql:mysql /var/www/mysql && \
    chmod 777 /var/www/mysql

COPY db_create.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

CMD ["mysqld_safe"]
