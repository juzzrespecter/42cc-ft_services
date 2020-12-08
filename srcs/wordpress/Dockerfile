FROM	alpine:latest

RUN		apk update; apk add --no-cache wget \
									php7-fpm \
									openrc; \
					wget https://es.wordpress.org/latest-es_ES.tar.gz;
					tar xzfv latest-es_ES.tar.gz; \
					mv /wordpress /var/www/html/; \
					rm latest-es_ES.tar.gz
VOLUME	/var/www/html

CMD		...
