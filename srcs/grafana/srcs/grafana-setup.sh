#!/bin/sh

openssl req -x509 -nodes -newkey rsa:4096 \
	-keyout /usr/local/share/ca-certificates/ssl-key.key \
   	-out /usr/local/share/ca-certificates/ssl-cert.crt -days 365 \
	-subj "/CN=influxdb-svc" \
	-addext "subjectAltName = DNS:influxdb-svc";

update-ca-certificates

cd /grafana/bin/
telegraf --config=/etc/telegraf/telegraf.conf &
./grafana-server
