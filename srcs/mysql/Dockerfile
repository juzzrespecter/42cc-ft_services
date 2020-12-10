FROM	alpine:latest

COPY	./srcs/mysql-config.sql /tmp

RUN		apk update; apk add mysql \
							mysql-client \
							openssl \
							openrc; \
					openrc; \
					touch /run/openrc/softlevel; \
					/etc/init.d/mariadb setup; \
					rc-service mariadb start; \
					mysql < /tmp/mysql-config.sql; \
					openssl req -x509 -nodes -newkey rsa:4096 -keyout /etc/ssl/private/nginx-key.key -out /etc/ssl/certs/nginx-cert.crt -days 365 \
						-subj "/C=ES/ST=Madriz/L=42/O=42/OU=services/CN=false_ip";

COPY	./srcs/mysql-setup.sh /

VOLUME	/var/lib/mysql

CMD		["/mysql-setup.sh"]
