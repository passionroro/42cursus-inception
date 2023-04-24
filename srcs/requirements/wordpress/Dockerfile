FROM php:7.4-fpm

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    curl \
    mariadb-client

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install gd && \
    docker-php-ext-install opcache

# Download and extract WordPress
RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    rm -rf latest.tar.gz && \
    mv wordpress /var/www/html

# Set permissions for the WordPress installation
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Set the working directory
WORKDIR /var/www/html

# Expose port 9000 to communicate with Nginx
EXPOSE 9000

# Start php-fpm
CMD ["php-fpm"]