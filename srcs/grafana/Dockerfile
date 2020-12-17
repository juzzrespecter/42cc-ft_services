FROM	alpine:latest

COPY	./srcs/grafana-setup.sh /

RUN		apk update; apk add wget \
							--repository=https://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat \
							--repository=https://dl-cdn.alpinelinux.org/alpine/edge/community telegraf; \
					wget -q https://dl.grafana.com/oss/release/grafana-7.1.2.linux-amd64.tar.gz; \
					tar -zxf grafana-7.1.2.linux-amd64.tar.gz; \ 
					mv grafana-7.1.2 grafana; \
					chmod +x grafana-setup.sh; \
					mkdir -p /etc/ssl;

EXPOSE	3000

CMD		["/grafana-setup.sh"]
