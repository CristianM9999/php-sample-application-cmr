# Use an official PHP 7.1 + Apache image
FROM php:7.1-apache

# Install required extensions for mysql connection
RUN docker-php-ext-install pdo pdo_mysql

# Enable mod_rewrite for clean URLs
RUN a2enmod rewrite

# Copy everything into the container
COPY . /var/www/html/

# Install required dependencies for installing composer
RUN apt-get update && apt-get install -y curl unzip

# Download Composer installer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Run composer with the composer.json file in the root directory
RUN composer install --no-dev --prefer-dist

# Set the correct DocumentRoot (since index.html is in "web/")
WORKDIR /var/www/html/web

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Copy the custom Apache virtual host configuration
COPY apache-vhost.conf /etc/apache2/sites-available/000-default.conf

# Expose port 80
EXPOSE 80

