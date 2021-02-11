FROM	alpine:3.12

COPY	./srcs/influxdb-setup.sh /

COPY	./srcs/dbconf.sh /

RUN		apk update; apk add influxdb \
						ca-certificates \
						openrc \
						--repository=http://dl-cdn.alpinelinux.org/alpine/edge/community telegraf; \
					rm -rf /var/cache/apk/*; \
					openrc; \
					touch /run/openrc/softlevel; \
					chmod +x /influxdb-setup.sh /dbconf.sh;

COPY	./srcs/influxdb.conf /etc/

COPY	./srcs/telegraf.conf /etc/telegraf/

EXPOSE	8086

CMD		["/influxdb-setup.sh"]
