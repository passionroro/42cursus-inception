FROM debian:10.13

# Installation: see wp-cli documentation
RUN apt-get update && \
    apt-get install -y php-fpm php-mysql curl

RUN cd /tmp && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp
    
RUN mkdir -p /var/www/wordpress

WORKDIR /var/www/wordpress

# Create non-root user for WordPress installation (security)
RUN groupadd -r wordpress && \
    useradd -r -g wordpress wordpress && \
    chown -R wordpress:wordpress /var/www/wordpress && \
    find /var/www/wordpress -type d -exec chmod 755 {} \; && \
    find /var/www/wordpress -type f -exec chmod 644 {} \;

USER wordpress

EXPOSE 9000

COPY wp-cli-config.sh /usr/local/bin/

#ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash","/usr/local/bin/wp-cli-config.sh"]
