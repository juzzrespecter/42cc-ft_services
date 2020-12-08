FROM	alpine:latest

RUN		apk update; apk add --no-cache nginx \
										openssl \
										php7-fpm \
										openrc; \
					openrc; \
					touch /run/openrc/softlevel; \
					mkdir -p /run/nginx; \
					rm -f /etc/nginx/conf.d/default.conf; \
					openssl req -x509 -nodes -newkey rsa:4096 -keyout /etc/ssl/private/nginx-key.key -out /etc/ssl/certs/nginx-cert.crt -days 365 \
						-subj "/C=ES/ST=Madriz/L=42/O=42/OU=services/CN=false_ip"


COPY	./srcs/default.conf	/etc/nginx/conf.d/

COPY	./srcs/nginx-setup.sh .

EXPOSE	80/tcp

EXPOSE	443/tcp

CMD		["/nginx-setup.sh"]
