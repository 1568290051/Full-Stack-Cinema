<template>
  <div class="register">
    <!-- 版心 -->
    <div class="container">
      <!-- 顶部导航 -->
      <div class="head">
        <div class="left_head">
          <a href>
            <!-- <img src="../../src/assets/movieLogo.png" class="logo" /> -->
          </a>
          <h1 class="title">注册</h1>
        </div>
        <div class="right_head">
          <span>已有账号？</span>
          <a href class="login-button">去登录</a>
        </div>
        <div class="switch">
          <span class="option">中文</span>
          /
          <span class="option">En</span>
        </div>
      </div>

      <el-card shadow="never">
        <el-form :model="ruleForm" :rules="rules" ref="regFormRef" label-width="80px">
          <el-form-item>
            <h1>注册电影天堂新账号</h1>
            <hr />
          </el-form-item>
          <el-form-item prop="username">
            <el-input placeholder="输入账号名" v-model="ruleForm.username">
              <i slot="prefix" class="el-input__icon el-icon-user"></i>
            </el-input>
          </el-form-item>
          <el-form-item prop="password">
            <el-input placeholder="输入密码" v-model="ruleForm.password" show-password>
              <i slot="prefix" class="el-input__icon el-icon-lock"></i>
            </el-input>
          </el-form-item>
          <el-form-item prop="email">
            <el-input placeholder="输入邮箱" v-model="ruleForm.email">
              <i slot="prefix" class="el-input__icon el-icon-lock"></i>
            </el-input>
          </el-form-item>
          <el-form-item prop="phone">
            <el-input placeholder=" 输入常用手机号" v-model="ruleForm.phone">
              <i slot="prefix" class="el-input__icon el-icon-mobile-phone"></i>
            </el-input>
          </el-form-item>
          <el-form-item>
            <el-checkbox v-model="checked">
              我已阅读并同意
              <a href>隐私政策</a>
              <a href>《电影天堂服务协议》</a>
            </el-checkbox>
          </el-form-item>
          <el-row>
            <el-col :offset="9">
              <el-button type="primary" @click="register">同意协议并注册</el-button>
              <!-- <el-button type="info" @click="resetForm">重置</el-button> -->
            </el-col>
          </el-row>
        </el-form>
      </el-card>

      <div class="footer">
        <span>Copyright©2012-2019 JDCloud.com 版权所有 京ICP备11041704号-31 京ICP证070359号</span>
        <a href>隐私声明 &nbsp;&nbsp;&nbsp;资质证照</a>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      ruleForm: {
        username: "",
        password: "",
        email: "",
        phone: ""
      },
      checked: false,
      rules: {
        username: [
          {
            required: true,
            message: "请输入用户名，不能为空",
            trigger: "blur"
          },
          { min: 2, max: 8, message: "长度在 2 到 8 个字符", trigger: "blur" }
        ],
        password: [
          { required: true, message: "请输入密码，不能为空", trigger: "blur" },
          { min: 6, max: 18, message: "长度在 6 到 18 个字符", trigger: "blur" }
        ],
        email: [
          { required: true, message: "请输入邮箱，不能为空", trigger: "blur" }
        ],
        phone: [
          {
            required: true,
            message: "请输入手机号，不能为空",
            trigger: "blur"
          },
          { min: 11, max: 11, message: "长度在 11 个字符", trigger: "blur" }
        ]
      }
    };
  },
  methods: {
    // 点击重置表单项
    resetForm() {
      // 调用 resetFields 方法，重置表单
      // this.$refs.regForm.resetFields();
    },
    register() {
      // 调用 validate 进行表单的预验证
      this.$refs.regFormRef.validate(async valid => {
        // 如果验证失败，直接return
        if (!valid) {
          return false;
        }
        if (this.checked == true) {
          const res = await this.$http.post("/cinema/register", this.ruleForm);
          // console.log(res.config.data);
          // 提示登录失败！
          if (res.data.code !== 200) return this.$message.error("添加用户失败");
          this.$message.success("添加用户成功");
          // 重置表单
          // this.$refs.regForm.resetFields();
          // 路由跳转
          this.$router.push = "/login";
        }
        // 验证通过
      });
    }
  }
};
</script>

<style>
body {
  font-size: 14px;
  line-height: 1;
}
* {
  margin: 0;
  padding: 0;
}

a {
  color: #4a90e2;
  text-decoration: none;
}

.login-button {
  margin-right: 91px;
}
.footer {
  width: 587px;
  height: 100px;
  /* background-color: #67a; */
  margin: 48px 324px;
  margin: 48px 324px;
}
.footer span {
  display: block;
  font-size: 13px;
}
.footer a {
  display: block;
  width: 600px;
  height: 60px;
  line-height: 60px;
  text-align: center;
  color: rgb(37, 37, 37);
}
/* .footer a:hover{
  color: antiquewhite;
} */
.register {
  background-color: #fff;
  /* background-color: #f4f4f4; */
}

.container {
  /* width: 1200px; */
  margin: auto;
}

.el-card__body {
  width: 1200px;
}

/* 验证提示 */
.el-form-item__error {
  color: #f56c6c;
  font-size: 12px;
  line-height: 1;
  padding-top: 4px;
  position: absolute;
  top: 45px;
  left: 370px;
}

.head {
  width: 100%;
  height: 60px;
  border-bottom: 1px solid #f2f2f2;
  background-color: #fff;
}

.logo {
  float: left;
  height: 36px;
  margin-top: 12px;
}

.title {
  float: left;
  font-size: 18px;
  font-weight: 400;
  line-height: 20px;
  color: #333;
  margin: 21px 0 0 83px;
}
.el-input__inner {
  margin-bottom: 10px;
}

.right_head {
  float: right;
  font-size: 14px;
  line-height: 20px;
  margin: 20px 0 0 0;
}

.switch {
  float: right;
  font-size: 14px;
  line-height: 20px;
  margin: 20px 12px 0 0;
}

.switch span {
  margin-left: 2px;
  margin-right: 2px;
  color: #4a90e2;
  cursor: pointer;
}
.switch .option {
  color: #333;
  cursor: not-allowed;
}

/* 主体部分 */
.main {
  padding: 50px 0 0 0;
  /* background-color: #f4f4f4; */
}

.panel {
  margin: 0;
  /* background: rgb(49, 42, 42); */
}

.panel_head {
  height: 80px;
  line-height: 80px;
  border-bottom: 1px solid #eee;
}

.panel_head h2 {
  font-size: 30px;
  font-weight: 400;
  text-align: center;
}

.panel_body {
  min-height: 400px;
  overflow: hidden;
}

.form_main {
  font-size: 0;
  width: 320px;
  margin: 0 auto;
  padding: 40px 0 60px 0;
}

.el-form {
  padding-top: 30px;
}
.el-input {
  width: 350px;
  margin-left: 370px;
}
h1 {
  text-align: center;
  font-size: 30px;
  font-weight: 400;
  padding: 0px 10px;
  margin-bottom: 18px;
}

.el-button--primary {
  width: 349px;
  background-color: #c0bbbb;
  font-size: 17px;
  margin-left: 3px;
}
.el-checkbox {
  margin-left: 375px;
}
.head {
  margin-bottom: 30px;
  width: 100%;
}
.register {
  background-color: #f4f4f4;
}
</style>