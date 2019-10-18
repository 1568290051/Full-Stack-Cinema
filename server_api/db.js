// 引入数据库
const mysql = require('mysql');
// 引入配置文件
const config = require('./config')
// 创建数据库连接
const connection = mysql.createConnection(config.db)
// 连接数据库
connection.connect();
// 导出
module.exports = connection
