#!/bin/sh
rc-service telegraf start
/etc/init.d/mariadb setup
mysql < /tmp/mysql-config.sql
mysql < /tmp/create_tables.sql
mysqld_safe
