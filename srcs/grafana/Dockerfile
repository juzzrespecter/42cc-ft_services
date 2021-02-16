FROM	alpine:3.12

COPY	./srcs/grafana-setup.sh /

RUN		apk update; apk add wget \
				openssl \
				nginx \
				ca-certificates; \
		rm -rf /var/cache/apk/*; \
		wget https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64.tar.gz; \
		tar -zxvf grafana-7.3.7.linux-amd64.tar.gz; \
		mv grafana-7.3.7 grafana; \
		mkdir -p /etc/ssl/certs/;

RUN		apk update; apk add --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat \
		openrc; \
		chmod +x grafana-setup.sh;

COPY	./srcs/defaults.ini /grafana/conf/

COPY	./srcs/influxdb.yaml /grafana/conf/provisioning/datasources

COPY	./srcs/db/ /grafana/conf/provisioning/dashboards

WORKDIR	/grafana/bin/

EXPOSE	3000

CMD		["/grafana-setup.sh"]
