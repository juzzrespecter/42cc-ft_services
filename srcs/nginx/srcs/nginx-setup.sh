#!/bin/sh

/etc/init.d/sshd start							# setup ssh server	
adduser -D usr									# create ssh user with passwd
echo "usr:$(echo $USR_PASSWD)" | chpasswd		#

update-ca-certificates							# set up root certificates

rc-service php-fpm7 start						# initialize nginx server 
nginx -g 'daemon off;'							#
