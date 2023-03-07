#!/bin/bash

sleep 10

if [ ! -a wp-config.php ]; then
	wp config create --allow-root \
		--dbname=$SQL_DATABASE \
		--dbuser=$SQL_USER \
		--dbpass=$SQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--path='/var/www/wordpress'

	# configurer la page automatiquement
	wp core install --allow-root \
		--url=$WP_SITE \
		--title=$WP_TITLE \
		--admin_user=$WP_AMIN \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_ADMIN_EMAIL \
		--path='/var/www/wordpress' 

	# creer un second utilisateur
	wp user create  \
		$WP_USER \
		$WP_USER_EMAIL \
		--role=$USER_ROLE \
		--user_pass=$WP_USER_PASSWORD \
		--admin_email=$WP_USER_EMAIL \
		--path='/var/www/wordpress' 

fi

if [ ! -d /run/php ]; then
	mkdir -p /run/php
fi

# run php-fpm:
/usr/sbin/php-fpm7.3 -F