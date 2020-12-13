FROM	alpine:latest

COPY	./srcs/mysql-config.sql /tmp

RUN		apk update; apk add mariadb \
							mariadb-client \
							mariadb-common \
							openrc; \
					openrc; \
					touch /run/openrc/softlevel; \
					/etc/init.d/mariadb setup;

COPY	./srcs/mysql-setup.sh /

CMD		["/mysql-setup.sh"]
