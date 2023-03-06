sleep 10

if [! -a wp-config.php]
then
	wp config create	--allow-root \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306 \ 
						--path='/var/www/wordpress'

# configurer la page automatiquement 			
	wp core install --url=$WP_SITE \
					--title=$WP_TITLE \
					--admin_user=$WP_AMIN \
					--admin_password=$WP_ADMIN_PASSWORD \
					--admin_email=$WP_ADMIN_EMAIL \

# creer un second utilisateur
	wp user create
fi

if [! -d /run/php]
then 
	mkdir -p /run/php
fi

# run php-fpm:
/usr/sbin/php-fpm7.3 -F

