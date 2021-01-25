FROM	alpine:3.12

COPY	./srcs/grafana-setup.sh /

RUN		apk update; apk add --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat \
							--repository=https://dl-cdn.alpinelinux.org/alpine/edge/community telegraf \
							openrc; \
					chmod +x grafana-setup.sh;

COPY	./srcs/grafana /grafana

EXPOSE	3000

CMD		["/grafana-setup.sh"]
