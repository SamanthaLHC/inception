sleep 10

# si pas de wp-config.php do : 
wp config create	--allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'

# todo  configurer la pas automatiquement 			
wp core install
# todo  configurer la pas automatiquement creer un utilisateur
wp user create

# si pas de dossier le creer:
mkdir -p /run/php

/usr/sbin/php-fpm7.3 -F

