#!/bin/sh
rc-service telegraf start
/etc/init.d/mariadb setup
rc-service mariadb start
mysql < /tmp/mysql-config.sql
mysql < /tmp/create_tables.sql
rc-service mariadb stop
mysqld_safe
