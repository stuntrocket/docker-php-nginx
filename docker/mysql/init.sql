CREATE DATABASE /*!32312 IF NOT EXISTS*/ `app`;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `test`;

USE mysql;
GRANT ALL ON *.* TO 'homestead'@'%';
FLUSH PRIVILEGES;
