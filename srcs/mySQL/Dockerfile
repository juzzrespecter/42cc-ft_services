FROM		alpine:latest

ENV			WP_DATABASE	database

ENV			WP_USERNAME user

ENV			WP_PASSWD passwd

ENV			ROOT_PASSWD si

COPY		./srcs/mysql-config.sql /tmp/mysql-config.sql

RUN			apk update; apk add --no-cache mysql \
										mysql-client \
										openrc; \
					openrc; \
					touch /run/openrc/softlevel; \
					/etc/init.d/mariadb setup; \
					/etc/init.d/mariadb start; \
					mysql -u root < /tmp/mysql-config.sql; \
					/etc/init.d/mariadb stop

COPY		./srcs/mysql-setup.sh /

EXPOSE		3306

ENTRYPOINT	["/mysql-config.sh"]
