FROM debian:10.13
 
RUN apt-get update && \
    apt-get install -y php-fpm php-mysql curl

#wordpress command line installation
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

#and on wp commands
RUN chown -R wordpress:wordpress /usr/local/bin/wp && \
    chmod 755 /usr/local/bin/wp

COPY wp-cli-config.sh /usr/local/bin/

USER wordpress

ENTRYPOINT ["tail", "-f", "/dev/null"]
#ENTRYPOINT ["sh", "/usr/local/bin/wp-cli-config.sh"]
