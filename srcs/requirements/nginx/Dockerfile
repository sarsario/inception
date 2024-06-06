FROM debian:buster

RUN apt-get update
RUN apt-get install -y \
	nginx \
	openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/inception.crt \
       -keyout /etc/nginx/ssl/inception.key \
       -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=osarsari/CN=osarsari/"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /run/nginx

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]