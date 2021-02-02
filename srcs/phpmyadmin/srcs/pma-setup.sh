#!/bin/sh
rc-service telegraf start
rc-service php-fpm7 start
sed -i -e "s/CHANGE_USER/$(echo $PMA_USER)/" /var/www/config.inc.php
sed -i -e "s/CHANGE_PASSWD/$(echo $PMA_PASSWD)/" /var/www/config.inc.php
nginx -g 'daemon off;'
