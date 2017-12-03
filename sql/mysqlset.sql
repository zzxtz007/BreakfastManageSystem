--添加数据库
CREATE DATABASE IF NOT EXISTS breakfast DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建用户
GRANT USAGE
ON *.* TO 'breakfast'@'localhost' IDENTIFIED BY 'stu123456' WITH GRANT OPTION;

--添加权限


GRANT all ON breakfast.* TO 'breakfast'@'localhost' IDENTIFIED BY 'stu123456';

--刷新权限
FLUSH PRIVILEGES;
