FROM debian:buster

EXPOSE 443

RUN apt-get update
RUN apt-get install -y \
	nginx \
	openssl && \
       rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/osarsari.crt \
       -keyout /etc/nginx/ssl/osarsari.key \
       -subj "//C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=osarsari.42.fr/UID=osarsari"

RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]