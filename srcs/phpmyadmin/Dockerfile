FROM	alpine:latest

RUN	apk update; apk add nginx \
				php7-fpm \
				wget \
				openrc; \
			openrc; \
			touch /etc/openrc/softlevel; \
			cd /tmp; \
			wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz; \
			mv phpMyAdmin-5.0.4-all-languages /var/www/phpmyadmin; \
			addgroup -S www; \
			adduser -S -H www -g www; \
			chown www:www /var/www; \
			chmod 755 /var/www;

COPY	--chown=www:www ./srcs/nginx.conf /etc/nginx/

COPY	--chown=www:www ./srcs/config.inc.php /var/www/phpmyadmin/

COPY	./srcs/pma-setup.sh /

CMD	["/pma-setup.sh"]
