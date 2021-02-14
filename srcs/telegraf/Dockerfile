FROM	alpine:3.12

COPY	./srcs/telegraf-setup.sh /

RUN		echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN		apk update; apk add telegraf; \
		chmod +x /telegraf-setup.sh;

CMD		["/telegraf-setup.sh"]
