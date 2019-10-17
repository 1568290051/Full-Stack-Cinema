
// 
// 要安装的依赖包
// npm i express md5 mysql body-parser cors jsonwebtoken
// 

// 引入框架
const express = require('express')
const config = require('./config')
// 创建框架对象
const app = express()
// 引入 body-parser
const bodyParser = require('body-parser')
app.use(bodyParser.urlencoded({ extended: false }))
var cors=require('cors');
app.use(cors({
    origin:['http://localhost:8989'],  //指定接收的地址
    methods:['GET','POST'],  //指定接收的请求类型
    alloweHeaders:['Content-Type','Authorization']  //指定header
}))

// 引入路由
app.use('/api/v1', require('./router/login'))
app.use('/api/v1', require('./router/register'))

// 连接跑起来~~~
app.listen(
  config.server.port,
  config.server.ip,
  () => {
    console.log(`running at: ${config.server.ip} : ${config.server.port}`)
  }
)