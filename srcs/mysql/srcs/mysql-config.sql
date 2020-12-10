CREATE DATABASE wp_database;
GRANT ALL PRIVILEGES ON wp_database.* TO 'wp_admin'@'localhost' IDENTIFIED BY 'wp_passwd';
FLUSH PRIVILEGES;
