#!/bin/sh
rc-service telegraf start
rc-service php-fpm7 start
nginx -g 'daemon off;'
