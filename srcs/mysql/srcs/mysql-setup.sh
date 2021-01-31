#!/bin/sh
rc-service telegraf start
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u root < /tmp/mysql-config.sql
mysql -u root < /tmp/create_tables.sql
mysql -u root < /tmp/wp_database.sql
mysqld_safe --datadir=/var/lib/mysql
