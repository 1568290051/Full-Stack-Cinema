// 引入express
const express = require('express')
// 使用express 创建服务
const app = express()
// 引入配置文件
const config = require('./config')
// 引用body——parser包
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));

var cors=require('cors');
app.use(cors())
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
app.listen(config.server.port, config.server.ip, () => console.log('http://127.0.0.1:8989'))