const jwt = require('jsonwebtoken')
// 引入 md5加密
const { md5_key } = require('./config')
// 创建路由 
const router = require('express').Router()

// 验证令牌
router.use((req, res, next) => {
  // 判断是否提交了令牌
  if (req.headers.authorization == undefined) {
    res.json({
      "code": 401
    })
  } else {
    // 获取令牌
    let token = req.headers.authorization.replace(/^Bearer /, '')
    try {
      // 解析令牌
      let decoded = jwt.verify(token, md5_key)
      // 把解析的数据保存到 req.user 上
      req.user = decoded
      next()
    } catch(error) {
      res.json({
        "code": 401
      })
    }
  }
})

// 生成令牌的函数
let makeJWT = function(data) {
  return jwt.sign(data, md5_key, { expiresIn: '2h'})
}

module.exports = {
  makeJWT,
  router
}