FROM	alpine:3.12

RUN	apk update; apk add wget \
				nginx \
				openrc \
				openssl \
				php-fpm \
				php7-common \
				php7-iconv \
				php7-json \
				php7-gd \
				php7-curl \
				php7-xml \
				php7-imap \
				php7-cgi \
				fcgi \
				php7-pdo \
				php7-pdo_mysql \
				php7-soap \
				php7-xmlrpc \
				php7-posix \
				php7 \
				php-mysqli --no-cache \
				--repository=http://dl-cdn.alpinelinux.org/alpine/edge/community telegraf; \
			openrc; \
			touch /run/openrc/softlevel; \
			cd /tmp; \
			wget https://wordpress.org/latest.tar.gz; \
			tar xzf latest.tar.gz; \
			mkdir -p /var/www/html/; \
			rm -rf latest.tar.gz; \
			mkdir -p /run/nginx/; \
			addgroup -S www; \
			adduser -S -H www -g www; \
			chown -R www:www /tmp/wordpress; \
			chmod -R 755 /tmp/wordpress;

COPY	--chown=www:www ./srcs/nginx.conf /etc/nginx/

COPY	./srcs/wordpress-setup.sh /

COPY	--chown=www:www ./srcs/wp-config.php /tmp/wordpress/

VOLUME	/var/www/html/

EXPOSE	80/tcp

CMD	["/wordpress-setup.sh"]
