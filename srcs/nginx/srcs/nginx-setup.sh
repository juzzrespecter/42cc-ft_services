#!/bin/sh

# set up ssh server and user for ssh access
/etc/init.d/sshd start
adduser -D usr_joking
echo "guest:$(echo $USR_PASSWD)" | chpasswd

# init telegraf
telegraf --config /etc/telegraf/telegraf.conf &

# set up server
rc-service php-fpm7 start
nginx -g 'daemon off;'
sleep 1000
