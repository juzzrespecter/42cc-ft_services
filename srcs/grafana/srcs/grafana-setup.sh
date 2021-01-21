#!/bin/sh
rc-service telegraf start
cd /grafana/bin/
./grafana-server
sleep 500
