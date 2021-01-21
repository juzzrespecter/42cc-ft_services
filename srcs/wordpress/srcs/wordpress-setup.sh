#!/bin/sh
rc-service telegraf start
rc-service php-fpm7 start
cd /var/www/
sed -i -e "s/db_name/$(echo $DB_NAME)/" /var/www/wp-config.php
sed -i -e "s/db_user/$(echo $DB_USER)/" /var/www/wp-config.php 
sed -i -e "s/db_password/$(echo $DB_PASSWORD)/" /var/www/wp-config.php 
nginx -g 'daemon off;'
