#!/bin/bash
set -x

if [ ! -f "/var/lib/mysql/file_flag_mdb_done" ]; then

	service mysql start

	# Wait for service to be ready
	echo -n "Waiting for service to be fully started"
	sleep 1 # Sleep at least once
	while [ ! -e /var/run/mysqld/mysqld.sock ]; do 
		echo -n .
		sleep 1
	done
	echo ""
	
	mysql << EOF
CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
CREATE USER IF NOT EXISTS \`${SQL_USER}\`@\`localhost\` IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF
	sleep 5
	mysqladmin -uroot -p$SQL_ROOT_PASSWORD shutdown
	touch /var/lib/mysql/file_flag_mdb_done
fi

set +x
exec mysqld