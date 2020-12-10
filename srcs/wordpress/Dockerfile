FROM	alpine:latest

RUN	apk update; apk add wget \
				nginx \
				openrc; \
				php7-fpm; \
			openrc; \
			touch /run/openrc/softlevel; \
			cd /tmp; \
			wget https://wordpress.org/latest.tar.gz; \
			tar xzf latest.tar.gz; \
			mv wordpress /var/www/; \
			addgroup -S www; \
			adduser -S -H www -g www; \
			chown www:www /var/www; \
			chmod 755 /var/www;

COPY	--chown=www:www ./srcs/nginx.conf /etc/nginx/

COPY	./srcs/wordpress-setup.sh /

COPY	--chown=www:www ./srcs/wp-config.php /var/www/wordpress/

CMD	["/wordpress-setup.sh"]
