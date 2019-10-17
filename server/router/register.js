// 连接数据库
const db = require('../db')
// md5加密
const md5 = require('md5')
const { md5_key } = require('../config')
// 创建需要令牌验证的路由  改成jwt.js中的路由
const { router } = require('../jwt')
// 接口名称
const apiName = 'cinema'

router.post(`/${apiName}/register`, (req, res) => {
  // 接口数据并验证
  let username = req.body.username || ''
  let password = req.body.password || ''
  // if (username.length < 2 || username.length > 8) {
  //   res.json({
  //     "code": 400,
  //     "error": "用户名必须2~8位"
  //   })
  //   return
  // }
  // if (password.length < 6 || password.length > 18) {
  //   res.json({
  //     "code": 400,
  //     "error": "密码必须在6~18位"
  //   })
  //   return
  // }
  // 插入到数据库中
  let sql = 'INSERT INTO users SET ?'
  let data = {
    username,
    password: md5(password + md5_key)
  }
  db.query(sql, data, (error, results, fields) => {
    if (error) {
      res.json({
        "code": 400,
        "error": error.message
      })
    } else {
      res.json({
        "code": 200,
        "message": "恭喜添加成功"
      })
    }
  })

})


module.exports = router