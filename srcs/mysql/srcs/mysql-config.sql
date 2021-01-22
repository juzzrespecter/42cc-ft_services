CREATE DATABASE wp_database;
GRANT ALL PRIVILEGES ON wp_database.* TO 'wp_admin'@'mysql-svc.default.svc.cluster.local' IDENTIFIED BY 'wp_passwd';
FLUSH PRIVILEGES;
