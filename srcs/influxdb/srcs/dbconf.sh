#!/bin/sh

while [ influx ]
do
	echo "Waiting for InfluxDB to start...";
	sleep 1;
done

echo "create database telegraf" | influx;
echo "create user telegraf with password '$TELEGRAF_PW'" | influx;
echo "grant all on telegraf to telegraf" | influx;
