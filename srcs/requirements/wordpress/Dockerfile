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

# Install WordPress
RUN wget https://fr.wordpress.org/wordpress-6.0.fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0.fr_FR.tar.gz && rm wordpress-6.0.fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress
# Download and extract WordPress
# ADD https://wordpress.org/latest.tar.gz /tmp/latest.tar.gz
# RUN tar -xzf /tmp/latest.tar.gz -C /var/www/wordpress --strip-components=1 && \
#     rm /tmp/latest.tar.gz

# Download and set up WP-CLI
RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp

# Copy configuration script
COPY ./conf/config.sh /var/www/wordpress/config.sh
RUN chmod +x /var/www/wordpress/config.sh

# Set the working directory
# WORKDIR /var/www/wordpress

# Set the command to run the configuration script
CMD ["bash", "/var/www/wordpress/config.sh"]
