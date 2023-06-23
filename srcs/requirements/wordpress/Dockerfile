FROM debian:10.13
 
RUN apt-get update && \
    apt-get install -y dialog apt-utils curl mariadb-server php php-common php-fpm php-mysql 

RUN cd /tmp && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp
    
RUN mkdir -p /var/www/wordpress

WORKDIR /var/www/wordpress

#create non-root user for WordPress installation (security)
RUN groupadd -r wordpress && \
    useradd -r -g wordpress wordpress

#set permissions on /var/www/wordpress directory
RUN chown -R wordpress:wordpress /var/www/wordpress && \
    chmod 755 /var/www/wordpress

#and on `wp` commands
RUN chown -R wordpress:wordpress /usr/local/bin/wp && \
    chmod 755 /usr/local/bin/wp

COPY entrypoint.sh /usr/local/bin/

COPY wp-config.php /var/www/wordpress

USER wordpress

ENTRYPOINT ["/bin/sh", "-c", "/usr/local/bin/entrypoint.sh"]
