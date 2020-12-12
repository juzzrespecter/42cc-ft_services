FROM	alpine:latest

COPY	./srcs/mysql-config.sql /tmp

RUN		apk update; apk add mysql \
							mysql-client \
							openssl \
							sudo \
							openrc; \
					openrc; \
					touch /run/openrc/softlevel; \
					/etc/init.d/mariadb setup; \
					rc-service mariadb start; \
					mysql < /tmp/mysql-config.sql;

VOLUME	/var/lib/mysql

CMD		["sudo",  "mysqld_safe"]
