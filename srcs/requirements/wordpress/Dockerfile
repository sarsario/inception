FROM debian:buster

EXPOSE 9000

RUN apt-get update -y

RUN apt-get install -y \
    php7.3-fpm \
    php7.3-mysql \
    mariadb-client \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz \
    && rm -rf wordpress-6.0-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

COPY ./conf/config.sh /var/www/wordpress/config.sh
RUN chmod +x /var/www/wordpress/config.sh

CMD ["bash", "/var/www/wordpress/config.sh"]

# ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz

# RUN cd /var/www && tar -xvf latest.tar.gz && rm -rf latest.tar.gz

# RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/local/bin/wp --silent
# RUN chmod +x /usr/local/bin/wp

# RUN mkdir /run/php

# COPY ./conf/config.sh /var/www/wordpress/config.sh
# RUN chmod +x /var/www/wordpress/config.sh

# CMD ["bash", "/var/www/wordpress/config.sh"]