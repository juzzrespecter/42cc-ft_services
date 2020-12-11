FROM	alpine:latest

RUN	apk update; apk add nginx \
				php-fpm \
				php-iconv \
				php-json \
				php-mbstring \
				php-gettext \
				php-session \
				php-mysqli \
				openssl \
				wget \
				openrc --no-cache; \
			openrc; \
			touch /run/openrc/softlevel; \
			cd /tmp; \
			wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz; \
			tar xfz phpMyAdmin-5.0.4-all-languages.tar.gz; \
			mv phpMyAdmin-5.0.4-all-languages/* /var/www/; \
			addgroup -S www; \
			adduser -S -H www -g www; \
			chown -R www:www /var/www; \
			chmod -R 755 /var/www; \
			mkdir -p /run/nginx; \
			openssl req -x509 -nodes -newkey rsa:4096 -keyout /etc/ssl/private/nginx-key.key -out /etc/ssl/certs/nginx-cert.crt -days 365 \
						-subj "/C=ES/ST=Madriz/L=42/O=42/OU=services/CN=false_ip";

COPY	--chown=www:www ./srcs/nginx.conf /etc/nginx/

COPY	--chown=www:www ./srcs/config.inc.php /var/www/

COPY	./srcs/pma-setup.sh /

CMD	["/pma-setup.sh"]