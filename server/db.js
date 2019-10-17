const mysql = require('mysql')
const config = require('./config')
// const pool = mysql.createPool(config.db)

// module.exports = pool.promise()

// 创建数据库连接
const connection = mysql.createConnection(config.db)
// 连接数据库
connection.connect();
// 导出
module.exports = connection
