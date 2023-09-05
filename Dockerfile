# Use a base image with Apache and PHP
FROM php:7.4-apache

# Set arguments for WordPress version and download URL
ARG WORDPRESS_VERSION=5.7.1
ARG WORDPRESS_URL=https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz

# Set the working directory
WORKDIR /var/www/html

# Install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Download and extract WordPress
RUN wget -qO- ${WORDPRESS_URL} | tar -xz --strip-components=1

# Copy custom Apache configuration
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# Enable Apache modules
RUN a2enmod rewrite

# Set the ownership of the WordPress files
RUN chown -R www-data:www-data .

# Expose port 80
EXPOSE 80

...
# Set environment variables
ENV DB_HOST=my-rds-instance.cgdtspve2qye.us-east-1.rds.amazonaws.com
ENV DB_NAME=my-rds-instance
ENV DB_USER=dicoverdollar
ENV DB_PASSWORD=dicoverdollar$


# Define the entry point and command
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
CMD []
