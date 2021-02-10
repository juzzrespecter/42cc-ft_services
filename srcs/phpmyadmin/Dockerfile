FROM	alpine:3.12

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
				openrc --no-cache \
				--repository=http://dl-cdn.alpinelinux.org/alpine/edge/community telegraf; \
			rm -rf /var/cache/apk/*; \
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
			mkdir -p /etc/ssl; \
			mkdir -p /var/www/tmp; \
			chown -R www:www /var/www/tmp; \
			chmod -R 777 /var/www/tmp; \
			rm /var/www/config.sample.inc.php;

COPY	--chown=www:www ./srcs/nginx.conf /etc/nginx/

COPY	--chown=www:www ./srcs/config.inc.php /var/www/

COPY	./srcs/pma-setup.sh /

CMD	["/pma-setup.sh"]
