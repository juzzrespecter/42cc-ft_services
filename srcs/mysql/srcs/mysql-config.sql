CREATE DATABASE IF NOT EXISTS wp_database;
GRANT ALL PRIVILEGES ON wp_database.* TO 'wp_admin'@'%.wordpress-svc.default.svc.cluster.local' IDENTIFIED BY 'wp_passwd';
GRANT ALL PRIVILEGES ON *.* TO 'pma'@'%.phpmyadmin-svc.default.svc.cluster.local' IDENTIFIED BY 'pmapass';
FLUSH PRIVILEGES;
