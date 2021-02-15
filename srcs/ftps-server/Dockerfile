FROM	alpine:3.12

RUN		apk update; apk add vsftpd \
							openrc; \
					rm -rf /var/cache/apk/*; \
					openrc; \
					touch /run/openrc/softlevel;
					
COPY	./srcs/vsftpd.conf	/etc/vsftpd/

COPY	./srcs/ftps-server-setup.sh /

EXPOSE	21

CMD		["/ftps-server-setup.sh"]
