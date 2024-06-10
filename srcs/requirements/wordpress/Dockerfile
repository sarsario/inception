FROM debian:buster

EXPOSE 9000

# Update and install necessary packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    php7.3-fpm \
    php7.3-mysql \
    mariadb-client \
    curl \
    tar \
    wget && \
    rm -rf /var/lib/apt/lists/*

# Create necessary directories
RUN mkdir -p /var/www/wordpress && mkdir -p /run/php

# Copy PHP-FPM configuration
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# Download and extract WordPress
ADD https://wordpress.org/latest.tar.gz /tmp/latest.tar.gz
RUN tar -xzf /tmp/latest.tar.gz -C /var/www/wordpress --strip-components=1 && \
    rm /tmp/latest.tar.gz

# Download and set up WP-CLI
RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp

# Copy configuration script
COPY ./conf/config.sh /var/www/wordpress
RUN chmod +x /var/www/wordpress/config.sh

# Set the working directory
WORKDIR /var/www/wordpress

# Set the command to run the configuration script
CMD ["bash", "/var/www/wordpress/config.sh"]
