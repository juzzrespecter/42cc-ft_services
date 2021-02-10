#!/bin/sh

while [ ! influx ]
do
	echo "Waiting for InfluxDB to start...";
	sleep 1;
done

echo "create user admin with password '$ADMIN_PASSWD' with all privileges" | influx -ssl -unsafeSsl;
echo "create database telegraf" | influx -ssl -unsafeSsl -username admin -password $ADMIN_PASSWD;
echo "create user telegraf with password '$TELEGRAF_PASSWD'" | influx -ssl -unsafeSsl -username admin -password $ADMIN_PASSWD;
echo "grant all on telegraf to telegraf" | influx -ssl -unsafeSsl -username admin -password $ADMIN_PASSWD;
