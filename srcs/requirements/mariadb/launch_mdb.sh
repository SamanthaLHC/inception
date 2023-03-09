#!/bin/bash

if [ ! -f "./file_flag_mdb_done" ]; then 
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld

	service mysql start

	mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
	mysql -uroot "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
	mysql -uroot "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
	mysql -uroot "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
	mysql -uroot "FLUSH PRIVILEGES;"

	mysqladmin -uroot -p$SQL_ROOT_PASSWORD shutdown
	touch file_flag_mdb_done
fi

exec mysqld
