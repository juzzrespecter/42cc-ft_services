FROM	alpine:latest

RUN	apk update; apk add wget \
				nginx \
				openrc \
				openssl \
				php7-fpm --no-cache; \
			openrc; \
			touch /run/openrc/softlevel; \
			cd /tmp; \
			wget https://wordpress.org/latest.tar.gz; \
			tar xzf latest.tar.gz; \
			mv wordpress /var/www/; \
			rm latest.tar.gz; \
			mkdir -p /run/nginx/; \
			addgroup -S www; \
			adduser -S -H www -g www; \
			chown www:www /var/www; \
			chmod 755 /var/www; \
			openssl req -x509 -nodes -newkey rsa:4096 -keyout /etc/ssl/private/nginx-key.key -out /etc/ssl/certs/nginx-cert.crt -days 365 \
				-subj "/C=ES/ST=Madriz/L=42/O=42/OU=services/CN=false_ip";

COPY	--chown=www:www ./srcs/nginx.conf /etc/nginx/

COPY	./srcs/wordpress-setup.sh /

COPY	--chown=www:www ./srcs/wp-config.php /var/www/wordpress/

VOLUME	/var/www/html

CMD	["/wordpress-setup.sh"]
