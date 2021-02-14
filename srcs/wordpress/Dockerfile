FROM	alpine:3.12

COPY	./srcs/wordpress-setup.sh /

RUN		echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories; \
		apk update; \
		apk add wget \
				lighttpd \
				openrc \
				php7-common \
				php7-iconv \
				php7-json \
				php7-gd \
				php7-curl \
				php7-xml \
				php7-mysqli \
				php7-imap \
				php7-cgi \
				fcgi \
				php7-pdo \
				php7-pdo_mysql \
				php7-soap \
				php7-xmlrpc \
				php7-posix \
				php7-mcrypt \
				php7-gettext \
				php7-ldap \
				php7-ctype \
				php7-dom; \
		rm -rf /var/cache/apk/*; \
		cd /tmp/; \
		wget https://wordpress.org/latest.tar.gz; \
		tar xzf latest.tar.gz; \
		rm latest.tar.gz wordpress/wp-config-sample.php; \
		chown -R lighttpd /tmp/wordpress; \
		openrc; \
		touch /run/openrc/softlevel; \
		chmod +x /wordpress-setup.sh

COPY	./srcs/lighttpd.conf /etc/lighttpd/

COPY	./srcs/wp-config.php /tmp/wordpress/

VOLUME	/var/www/localhost/htdocs/

EXPOSE	80/tcp

CMD		["/wordpress-setup.sh"]
