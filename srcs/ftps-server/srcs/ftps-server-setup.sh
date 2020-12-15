#!/bin/sh
rc-service telegraf start
rc-service vsftpd start
tail -f /dev/null
