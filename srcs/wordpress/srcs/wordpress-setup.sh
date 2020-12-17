#!/bin/sh
rc-service telegraf start
rc-service php-fpm7 start
cd /var/www/
sed -i "" -e 's/db_name/'$DB_NAME'/' wp-config.php
sed -i "" -e 's/db_user/'$DB_USER'/' wp-config.php 
sed -i "" -e 's/db_password/'$DB_PASSWORD'/' wp-config.php 
sed -i "" -e 's/db_host/'$DB_HOST'/' wp-config.php 
nginx -g 'daemon off;'
