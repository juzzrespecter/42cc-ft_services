#!/bin/sh
cd /grafana/bin/
telegraf --config=/etc/telegraf/telegraf.conf &
./grafana-server
