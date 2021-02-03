#!/bin/sh
rc-service vsftpd start
telegraf &
tail -f /dev/null
