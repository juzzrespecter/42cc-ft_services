FROM	alpine:latest

RUN		apk update; apk add vsftpd \
							openrc; \
					openrc; \
					touch /etc/openrc/softlvel;
					
COPY	./srcs/vsftpd.conf	/etc/vsftpd/

COPY	./srcs/ftps-server-setup.sh /

EXPOSE	21

CMD		["/ftps-server-setup.sh"]
