FROM debian:buster

RUN apt -y update && apt install nginx -y

RUN apt install OpenSSL -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt
-keyout /etc/nginx/ssl/inception.key 
-subj "/C=FR/ST=IDF/L=Paris/0=42/OU=42/CN=login.42.fr/UID=login"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf



