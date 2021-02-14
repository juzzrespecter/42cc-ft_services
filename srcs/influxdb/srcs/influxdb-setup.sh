#!/bin/sh

#############################################################
#				 install db if not present					#
#############################################################

DIR="/var/lib/influxdb/"
if [ ! "$(ls -A $DIR)" ]; then
	influxd -config=/etc/influxdb.conf &
   	sleep 1
	echo "create user admin with password '$ADMIN_PASSWD' with all privileges" | influx -ssl -unsafeSsl;
	echo "create database telegraf" | influx -ssl -unsafeSsl -username admin -password "$ADMIN_PASSWD";
	pkill influxd
fi

#############################################################
#					& influx database						#
#############################################################

update-ca-certificates
influxd -config=/etc/influxdb.conf
