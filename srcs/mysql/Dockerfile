FROM	alpine:3.12

COPY	./srcs/mysql-config.sql /tmp

RUN		apk update; apk add mysql \
							mysql-client \
							openrc \
							--repository=http://dl-cdn.alpinelinux.org/alpine/edge/community telegraf --no-cache; \
					openrc; \
					touch /run/openrc/softlevel; \
					/etc/init.d/mariadb setup;

COPY	./srcs/mysql-setup.sh /

CMD		["/mysql-setup.sh"]
