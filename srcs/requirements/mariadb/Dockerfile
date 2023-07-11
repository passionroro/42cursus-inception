FROM debian:10.13

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 755 /var/run/mysqld

COPY db_create.sql /usr/local/bin
RUN chmod +x /usr/local/bin/db_create.sql

COPY entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

#USER mysql

ENTRYPOINT ["/bin/sh", "-c", "/usr/local/bin/entrypoint.sh"]
