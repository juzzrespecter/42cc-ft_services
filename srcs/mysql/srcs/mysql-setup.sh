#!/bin/sh
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u root < /tmp/mysql-config.sql
echo "CREATE DATABASE IF NOT EXISTS wp_database;" | mysql -u root;
echo "GRANT ALL PRIVILEGES ON wp_database.* TO '$(echo $WP_ADMIN)'@'%' IDENTIFIED BY '$(echo $WP_PASSWD)';" | mysql -u root;
echo "GRANT ALL PRIVILEGES ON *.* TO '$(echo $PMA_USER)'@'%' IDENTIFIED BY '$(echo $PMA_PASSWD)';" | mysql -u root;
mysql -u root < /tmp/create_tables.sql
mysql -u root < /tmp/wp_database.sql
echo "DROP DATABASE test;" | mysql -u root;
echo "FLUSH PRIVILEGES;" | mysql -u root;
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$(echo $MYSQL_ROOT_PASSWD)';" | mysql -u root;
rc-service mariadb stop ## esto de una forma mas elegante??
telegraf --config=/etc/telegraf/telegraf.conf &
mysqld_safe
