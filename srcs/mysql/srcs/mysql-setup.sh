#!/bin/sh
/etc/init.d/mariadb setup
rc-service mariadb start
mysql < /tmp/mysql-config.sql
tail -f /dev/null
