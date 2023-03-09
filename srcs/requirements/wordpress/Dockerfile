FROM debian:buster

RUN apt update -y && apt -y install wget

RUN apt install -y php7.3 php-fpm php7.3-cli php-mysql mariadb-client

RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz

RUN chown -R root:root /var/www/wordpress

COPY wp.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY wp_conf.sh /wp_conf.sh

ENTRYPOINT [ "bash", "/wp_conf.sh" ]