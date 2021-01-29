FROM	alpine:3.12

RUN		apk update; apk add --no-cache nginx \
										php7-fpm \
										openrc \
										--repository=http://dl-cdn.alpinelinux.org/alpine/edge/community telegraf;  \
					openrc; \
					touch /run/openrc/softlevel; \
					addgroup -S www; \
					adduser -S -H www -g www; \
					chown -R www:www /var/www; \
					chmod -R 755 /var/www; \
					mkdir -p /run/nginx; \
					mkdir -p /etc/ssl; \
					rm -f /etc/nginx/conf.d/default.conf;

COPY	--chown=www:www ./srcs/nginx.conf /etc/nginx/

COPY	./srcs/nginx-setup.sh .

COPY	./srcs/telegraf.conf /tmp

EXPOSE	80/tcp

EXPOSE	443/tcp

CMD		["/nginx-setup.sh"]
