FROM debian:buster

EXPOSE 9000

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y php7.3-fpm php7.3-mysql mariadb-client curl
RUN rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php

COPY ./tools/get_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/get_wordpress.sh
ENTRYPOINT ["/usr/local/bin/get_wordpress.sh"]

WORKDIR /var/www/html/

CMD ["/usr/sbin/php-fpm7.3", "-F"]

# COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz
# RUN cd /var/www/ && \
#     tar -xvf latest.tar.gz && \
#     rm -rf latest.tar.gz

# RUN	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent
# RUN	chmod +x ./usr/bin/wp

# RUN mkdir /run/php

# COPY ./conf/config.sh ./config.sh
# RUN chmod +x config.sh

# CMD ["bash", "./config.sh"]