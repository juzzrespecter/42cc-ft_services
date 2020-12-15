#!/bin/sh
/etc/init.d/mariadb setup
rc-service mariadb start
mysql < /tmp/mysql-config.sql
rc-service telegraf start
tail -f /dev/null
