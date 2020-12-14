FROM	alpine:latest

RUN		apk update; apk add influxdb \
							openrc; \
					openrc; \
					touch /run/openrc/softlevel;

EXPOSE	8086

COPY	./srcs/influxdb-setup.sh /

CMD		["/influxdb-setup.sh"]
