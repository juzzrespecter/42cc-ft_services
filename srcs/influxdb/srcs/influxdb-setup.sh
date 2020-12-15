#!/bin/sh
rc-service telegraf start
rc-service influxdb start
tail -f /dev/null
