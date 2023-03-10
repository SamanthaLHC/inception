#!/bin/bash

# set -x
if [ ! -f /var/www/wordpress/wp-config.php ]; then

	sleep 10

	# wp core download --path='/var/www/wordpress'	
	wp config create --allow-root \
		--dbname=$SQL_DATABASE \
		--dbuser=$SQL_USER \
		--dbpass=$SQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--path='/var/www/wordpress'

	sleep 10
	# configurer la page automatiquement
	wp core install --allow-root \
		--url=$WP_SITE \
		--title=$WP_TITLE \
		--admin_user=$WP_AMIN \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_ADMIN_EMAIL \
		--path='/var/www/wordpress' 

	# creer un second utilisateur
	wp user create --allow-root \
		"$WP_USER" \
		"$WP_USER_EMAIL" \
		--role=author \
		--user_pass=$WP_USER_PASSWORD \
		--path='/var/www/wordpress'
else
	echo "wp-config php DONE" 
fi

if [ ! -d /run/php ]; then
	mkdir -p /run/php	
fi

# run php-fpm:
exec php-fpm7.3 -F

# set +x