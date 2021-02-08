#!/bin/sh
USR_FTPS=usr_ftps

adduser -D $USR_FTPS
echo "$USR_FTPS:$USR_PASSWD" | chpasswd
mkdir -p /home/$USR_FTPS/ftp
chown nobody:nogroup /home/$USR_FTPS/ftp
chmod a-w /home/$USR_FTPS/ftp
mkdir -p /home/$USR_FTPS/ftp/uploads
chown $USR_FTPS:$USR_FTPS /home/$USR_FTPS/ftp/uploads

echo $USR_FTPS | tee -a /etc/vsftpd/vsftpd.userlist

rc-service vsftpd start
telegraf --config=/etc/telegraf/telegraf.conf &
tail -f /dev/null
