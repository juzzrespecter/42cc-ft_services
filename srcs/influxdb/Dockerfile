FROM	alpine:3.12

RUN		apk update; apk add influxdb \
							openrc \
							--repository=http://dl-cdn.alpinelinux.org/alpine/edge/community telegraf; \
					openrc; \
					touch /run/openrc/softlevel;

EXPOSE	8086

COPY	./srcs/influxdb.conf /etc/

COPY	./srcs/influxdb-setup.sh /

COPY	./srcs/telegraf.conf /tmp

CMD		["/influxdb-setup.sh"]
