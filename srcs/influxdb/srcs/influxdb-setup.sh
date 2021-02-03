#!/bin/sh
echo "create database telegraf" | influx;
echo "create user telegraf with password '$(echo $TELEGRAF_PW)'" | influx;
echo "grant all on telegraf to telegraf" | influx;
telegraf &
influxd
