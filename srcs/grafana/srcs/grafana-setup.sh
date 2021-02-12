#!/bin/sh

update-ca-certificates
nginx
telegraf --config=/etc/telegraf/telegraf.conf &
./grafana-server
