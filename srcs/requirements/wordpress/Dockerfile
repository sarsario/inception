FROM debian:buster

# Install packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget
RUN apt-get install -y php7.3
RUN apt-get install -y php7.3-fpm
RUN apt-get install -y php7.3-mysql
RUN apt-get install -y mariadb-client

# Install wordpress
RUN wget https://wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# Add permissions
RUN chown -R root:root /var/www/wordpress

# Copy the configuration file of php and wordpress
