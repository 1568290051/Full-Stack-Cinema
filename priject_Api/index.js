// 引入express
const express = require('express')
// 使用express 创建服务
const app = express()
// 引入配置文件
const config = require('./config')
// 引用body——parser包
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));
// 引用cinema
const cinemaRouter = require('./router/cinema')

// 引入cors
var cors=require('cors');
app.use(cors())
// app.use(cors({
//     origin:['http://localhost:8989'],  //指定接收的地址
//     methods:['GET','POST'],  //指定接收的请求类型
//     alloweHeaders:['Content-Type','Authorization']  //指定header
// }))

// 使用cinemaRouter
app.use('/api/v1',cinemaRouter)
// 调用端口 开启服务
app.listen(config.server.port, config.server.ip, () => console.log('http://127.0.0.1:8989'))