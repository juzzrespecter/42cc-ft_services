#!/bin/sh
rc-service telegraf start
rc-service php-fpm7 start
cd /tmp
mv wordpress/* /var/www/html/
rm -rf wordpress
cd /var/www/
sed -i -e "s/db_name/$(echo $DB_NAME)/" /var/www/html/wp-config.php
sed -i -e "s/db_user/$(echo $DB_USER)/" /var/www/html/wp-config.php 
sed -i -e "s/db_password/$(echo $DB_PASSWORD)/" /var/www/html/wp-config.php 
nginx -g 'daemon off;'
