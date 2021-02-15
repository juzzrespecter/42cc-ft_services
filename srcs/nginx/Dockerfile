FROM	alpine:3.12

COPY	./srcs/nginx-setup.sh .

RUN		apk update; apk add --no-cache nginx \
										php7-fpm \
										openrc \
										openssh \
										ca-certificates; \
					rm -rf /var/cache/apk/*; \
					openrc; \
					touch /run/openrc/softlevel; \
					addgroup -S www; \
					adduser -S -H www -g www; \
					chown -R www:www /var/www; \
					chmod -R 755 /var/www; \
					mkdir -p /run/nginx; \
					mkdir -p /etc/ssl/certs; \
					rm -f /etc/nginx/conf.d/default.conf; \
					chmod +x /nginx-setup.sh

COPY	--chown=www:www ./srcs/nginx.conf /etc/nginx/

COPY	./srcs/index.html /var/www/

EXPOSE	80/tcp

EXPOSE	443/tcp

CMD		["/nginx-setup.sh"]
