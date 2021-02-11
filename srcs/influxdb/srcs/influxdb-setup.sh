#!/bin/sh

DIR="/var/lib/influxdb/"

openssl req -x509 -nodes -newkey rsa:4096 \
	-keyout /usr/local/share/ca-certificates/ssl-key.key \
   	-out /usr/local/share/ca-certificates/ssl-cert.crt -days 365 \
	-subj "/CN=influxdb-svc" \
	-addext "subjectAltName = DNS:influxdb-svc";

# install db if not present

if [ ! "$(ls -A $DIR)" ]; then
	/dbconf.sh &
fi

update-ca-certificates

# init telegraf & db

telegraf --config /etc/telegraf/telegraf.conf &
influxd -config=/etc/influxdb.conf
