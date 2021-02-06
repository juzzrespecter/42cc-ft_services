#!/bin/sh

WP_DIR="/var/www/localhost/htdocs/"

# install wordpress dependencies if not already installed
if [ ! "$(ls -A $WP_DIR)" ]; then
	mv -v /tmp/wordpress/* /var/www/localhost/htdocs/
	rm -rf /tmp/wordpress
	sed -i -e "s/db_name/$(echo $DB_NAME)/" /var/www/localhost/htdocs/wp-config.php
	sed -i -e "s/db_user/$(echo $DB_USER)/" /var/www/localhost/htdocs/wp-config.php 
	sed -i -e "s/db_password/$(echo $DB_PASSWORD)/" /var/www/localhost/htdocs/wp-config.php
fi

# init lighttp server && telegraf
rc-service lighttpd start
telegraf --config=/etc/telegraf/telegraf.conf &
tail -f /var/log/lighttpd/access.log
