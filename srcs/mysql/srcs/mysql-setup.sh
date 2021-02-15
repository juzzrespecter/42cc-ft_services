#!/bin/sh

if [ ! "$(ls -A "/var/lib/mysql/")" ]; then
	/etc/init.d/mariadb setup
	rc-service mariadb start
	echo "CREATE DATABASE IF NOT EXISTS wp_database;" | mysql -u root;
	mysql -u root < /tmp/wp_database.sql
	echo "GRANT ALL PRIVILEGES ON wp_database.* TO '$(echo $WP_ADMIN)'@'%' IDENTIFIED BY '$(echo $WP_PASSWD)';" | mysql -u root;
	echo "GRANT ALL PRIVILEGES ON *.* TO '$(echo $PMA_USER)'@'%' IDENTIFIED BY '$(echo $PMA_PASSWD)';" | mysql -u root;
	mysql -u root < /tmp/create_tables.sql
	echo "DROP DATABASE test;" | mysql -u root;
	echo "FLUSH PRIVILEGES;" | mysql -u root;
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$(echo $MYSQL_ROOT_PASSWD)';" | mysql -u root;
	rc-service mariadb stop
fi

rm -rf /tmp/*
mysqld_safe
