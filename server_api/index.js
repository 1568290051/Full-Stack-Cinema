
// 
// 要安装的依赖包
// npm i express md5 mysql body-parser cors jsonwebtoken
// 

// 引入express
const express = require('express')
// 使用express 创建服务
const app = express()
// 引入配置文件
const config = require('./config')
// 引用body——parser包
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));
// 解决跨域问题
var cors=require('cors');
app.use(cors({
    origin:['http://localhost:8080'],  //指定接收的地址
    methods:['GET','POST'],  //指定接收的请求类型
    alloweHeaders:['Content-Type','Authorization']  //指定header
}))
// 引用cinema
const cinemaRouter = require('./router/cinema')
// 使用cinemaRouter
app.use('/api/v1',cinemaRouter)
// 引用loginRouter
const loginRouter = require('./router/login')
app.use('/api/v1',loginRouter)
// // 引用register
const registerRouter = require("./router/register")
app.use('/api/v1',registerRouter)
// 调用端口 开启服务
// 连接跑起来~~~
app.listen(
  config.server.port,
  config.server.ip,
  () => {
    console.log(`running at: ${config.server.ip} : ${config.server.port}`)
  }
)