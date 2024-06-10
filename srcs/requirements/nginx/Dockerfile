FROM debian:buster

RUN apt-get update
RUN apt-get install -y \
	nginx \
	openssl && \
       rm -rf /var/lib/apt/lists/*

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/ssl/certs/osarsari.crt \
       -keyout /etc/ssl/private/osarsari.key \
       -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=osarsari/CN=osarsari/"

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]