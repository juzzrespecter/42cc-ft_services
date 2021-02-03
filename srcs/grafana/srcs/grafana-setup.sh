#!/bin/sh
cd /grafana/bin/
telegraf &
./grafana-server
