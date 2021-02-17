FROM	alpine:3.12

COPY	./srcs/sql/ /tmp

COPY	./srcs/mysql-setup.sh /

RUN		apk update; apk add mysql \
							mysql-client \
							openrc; \
					rm -rf /var/cache/apk/*; \
					openrc; \
					touch /run/openrc/softlevel; \
					chmod +x /mysql-setup.sh

COPY	./srcs/mariadb-server.cnf /etc/my.cnf.d/

CMD		["/mysql-setup.sh"]
