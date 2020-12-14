FROM	alpine:latest

COPY	./srcs/repositories /etc/apk/

RUN		apk update; apk add wget; \
					wget https://dl.grafana.com/oss/release/grafana-7.3.5.linux-amd64.tar.gz; \
					tar -zxvf grafana-7.3.5.linux-amd64.tar.gz; \

COPY	./srcs/grafana-setup.sh /

EXPOSE	3000

CMD		["/grafana-setup.sh"]
