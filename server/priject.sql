-- 创建数据库
CREATE DATABASE priject;
-- 进入数据库
USE priject;
-- 创建表
CREATE TABLE users(
  id int(10) auto_increment COMMENT '用户id',
  username VARCHAR(30) NOT NULL COMMENT '用户昵称',
  password VARCHAR(32) NOT NULL COMMENT '用户密码',
  email VARCHAR(25) NOT NULL COMMENT '用户邮箱',
  phone CHAR(25) NOT NULL COMMENT '用户手机号'
  PRIMARY KEY (id)
)charset=utf8;

  -- 插入数据
  insert into users values
  (null, '小幸运', 'aa123456','123@123','12345678910');

