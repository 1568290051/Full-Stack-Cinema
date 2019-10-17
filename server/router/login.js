
// 引入 md5加密
const md5 = require('md5')
const { md5_key } = require('../config')
// 引入jwt令牌验证
const jwt = require('jsonwebtoken')
// 引入数据库
const db = require('../db')
// 接口名称
const apiName = 'cinema'

// 创建路由 
// const router = require('express').Router()

// 创建需要令牌验证的路由  改成jwt.js中的路由
const { router } = require('../jwt')
// 配置登录的路由
router.post(`/${apiName}/login`, (req, res) => {
  let username = req.body.username
  let password = req.body.password
  let param = [username,password]
  // 登录校验？

  // 使用用户名到数据库查询有账号
  let sql = 'SELECT * FROM users WHERE username=? and password=?'
  db.query(sql, param, (error, results, fields) => {
    // 如果账号存在
    res.json(results[0])
    if (results[0]) {
      // 判断用户提交的密码和数据库中的密码是否一致
      if (md5(password + md5_key) == results[0].password) {
        let token = jwt.sign({
          id: results[0].id,
          username: results[0].username
        }, md5_key, { expiresIn: '2h' })

        res.json({
          "code": 200,
          "token": token
        })

      } else {
        res.json({
          "code": 400,
          "error": "您的密码有误"
        })
      }
    } else {
      res.json({
        "code": 400,
        "error": "该用户名不存在"
      })
    }
  })
})

module.exports = router