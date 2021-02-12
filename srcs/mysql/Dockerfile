FROM	alpine:3.12

COPY	./srcs/mysql-config.sql /tmp

COPY	./srcs/wp_database.sql /tmp

COPY	./srcs/create_tables.sql /tmp

RUN		apk update; apk add mysql \
							mysql-client \
							openrc \
							--repository=http://dl-cdn.alpinelinux.org/alpine/edge/community telegraf --no-cache; \
					rm -rf /var/cache/apk/*; \
					openrc; \
					touch /run/openrc/softlevel;

COPY	./srcs/mysql-setup.sh /

COPY	./srcs/mariadb-server.cnf /etc/my.cnf.d/


CMD		["/mysql-setup.sh"]
