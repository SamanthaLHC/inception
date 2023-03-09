#!/bin/bash

if [ ! -f "/var/lib/mysql/file_flag_mdb_done" ]; then 
	chown -R mysql:mysql /var/lib/mysql
	mkdir -p /var/run/mysqld
	chown -R mysql:mysql /var/run/mysqld

	service mysql start

	mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
	mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
	mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
	mysql -e "FLUSH PRIVILEGES;"

	mysqladmin -uroot -p$SQL_ROOT_PASSWORD shutdown
	touch /var/lib/mysql/file_flag_mdb_done
fi

exec mysqld_safe
