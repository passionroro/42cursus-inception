FROM debian:10.13

RUN apt-get update -y && \
    apt-get upgrade -y

RUN apt-get install -y vim mariadb-server expect

RUN mkdir -p /run/mysqld && \
    chown mysql:root /run/mysqld && \
    chmod -R 755 /run/mysqld && \
    chown mysql:root /var/lib/mysql && \
    chmod -R 755 /var/lib/mysql

COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY ./tools/mysql_secure.sh /usr/local/bin/mysql_secure.sh

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
