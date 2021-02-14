FROM	alpine:3.12

COPY	./srcs/influxdb-setup.sh /

COPY	./srcs/dbconf.sh /

RUN		apk update; apk add influxdb \
						ca-certificates \
						openrc \
						openssl \
					rm -rf /var/cache/apk/*; \
					openrc; \
					touch /run/openrc/softlevel; \
					mkdir -p /etc/ssl/certs/; \
					chmod +x /influxdb-setup.sh /dbconf.sh;

COPY	./srcs/influxdb.conf /etc/


EXPOSE	8086

CMD		["/influxdb-setup.sh"]
