#!/bin/sh
update-ca-certificates
cd /grafana/bin/
telegraf --config=/etc/telegraf/telegraf.conf &
./grafana-server
