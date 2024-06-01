FROM debian:buster

# Update and upgrade apt
RUN apt-get update && apt-get upgrade -y

# Install nginx and openssl
RUN apt-get install -y nginx openssl

# Create a directory for the SSL key and certificate
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout\
    /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj\
    "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=osarsari.42.fr"

# Create directory for nginx configuration and copy the configuration file
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Add permission to nginx user
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Start nginx
CMD ["nginx", "-g", "daemon off;"]