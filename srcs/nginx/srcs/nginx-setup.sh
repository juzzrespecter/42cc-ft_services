#!/bin/sh
rc-service php-fpm7 start
/etc/init.d/sshd start
telegraf &
nginx -g 'daemon off;'
