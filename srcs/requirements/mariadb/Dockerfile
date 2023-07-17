FROM debian:10.13

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client

COPY ./conf/mysqld.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/entrypoint.sh /usr/local/bin

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
