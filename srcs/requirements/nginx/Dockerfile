FROM debian:buster

RUN apt -y update && apt install nginx -y

RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
-keyout /etc/nginx/ssl/inception.key  \
-subj "/C=FR/ST=IDF/L=Paris/0=42/OU=42/CN=sle-huec.42.fr/UID=sle-huec"

RUN mkdir -p /var/run/nginx

COPY nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

CMD ["/usr/sbin/nginx", "-g", "daemon off;" ]


