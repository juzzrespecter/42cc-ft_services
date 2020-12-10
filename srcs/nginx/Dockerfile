FROM	alpine:latest

RUN	apk update; apk add nginx \
				openrc \
				openssl \
				php7-fpm; \
			adduser -S -H www -g www; \
			openrc; \
			touch /run/openrc/softlevel; \
			chown www:www /var/www; \
			chmod 755 /var/www;

COPY	--chown=www:www ./srcs/nginx.conf /etc/nginx/

COPY	./srcs/nginx-setup.sh /

CMD	["/nginx-setup.sh"]

