-- 创建数据库
CREATE DATABASE priject;
-- 进入数据库
USE priject;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- 创建表
DROP TABLE IF EXISTS `users`;
CREATE TABLE users(
  `id` int(10) auto_increment COMMENT '用户id',
  `username` VARCHAR(30) NOT NULL COMMENT '用户昵称',
  `password` VARCHAR(32) NOT NULL COMMENT '用户密码',
  `email` VARCHAR(25) NOT NULL COMMENT '用户邮箱',
  `phone` CHAR(25) NOT NULL COMMENT '用户手机号'
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


  -- 插入数据
  insert into users values
  (null, '小幸运', 'aa123456','123@123','12345678910');

