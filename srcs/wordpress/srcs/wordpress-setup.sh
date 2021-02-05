#!/bin/sh
mv -v /tmp/wordpress/* /var/www/localhost/htdocs/
rm -rf /tmp/wordpress
sed -i -e "s/db_name/$(echo $DB_NAME)/" /var/www/localhost/htdocs/wp-config.php
sed -i -e "s/db_user/$(echo $DB_USER)/" /var/www/localhost/htdocs/wp-config.php 
sed -i -e "s/db_password/$(echo $DB_PASSWORD)/" /var/www/localhost/htdocs/wp-config.php
rc-service lighttpd start
telegraf --config=/etc/telegraf/telegraf.conf &
tail -f /var/log/lighttpd/error.log
