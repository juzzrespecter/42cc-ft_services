FROM	alpine:3.12

COPY	./srcs/influxdb-setup.sh /

COPY	./srcs/dbconf.sh /

RUN		apk update; apk add influxdb \
							openrc \
							--repository=http://dl-cdn.alpinelinux.org/alpine/edge/community telegraf; \
					openrc; \
					touch /run/openrc/softlevel; \
					chmod +x /influxdb-setup.sh /dbconf.sh;

EXPOSE	8086

COPY	./srcs/influxdb.conf /etc/

COPY	./srcs/telegraf.conf /etc/telegraf/

CMD		["/influxdb-setup.sh"]
