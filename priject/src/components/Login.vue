<template>
  <div class="column__container">
    <div class="column__inner">
      <div class="login-form">
        <div class="login-con">
          <div class="login-form__title i18n-text">2W登录</div>
          <div
            class="login-form__group"
            :model="loginForm"
            :rules="loginFormRules"
            ref="loginFormRef"
          >
            <input
              type="text"
              value
              placeholder="请输入 账号名字 手机 邮箱"
              tabindex="1"
              id="loginName"
              class="login-loading"
              prop="username"
              v-model="addForm.username"
            />
          </div>
          <div class="login-form__group">
            <input
              type="password"
              placeholder="请输入密码"
              tabindex="2"
              id="password"
              class="login-loading"
              prop="password"
              v-model="addForm.password"
            />
          </div>
          <div class="login-form__group" style="margin-bottom: 0px;">
            <button
              id="loginSubmit"
              class="btn login-form__submit i18n-text login-loading"
              type="submit"
              tabindex="3"
              clstag="Login|keycount|MiddleContentSec|LoginButton"
              style="white-space: pre;"
              @click="addUser"
            >登录</button>
          </div>
          <p class="skip-btn cl">
            <a href class="regis il8t-text" clstag="Login|keycount|middleContentSec|Register">免费注册</a>
            <a
              class="forpassword i18n-text"
              href=""
              clstag="Login|keycount|middleContentSec|ForgotPwd"
            >忘记密码</a>
          </p>
          <ul class="boundary-ul">
            <li class="boundary-left"></li>
            <li class="boundary-center i18n-text">其他登录方式</li>
            <li class="boundary-right"></li>
          </ul>
          <div class="jd-account">
            <span
              class="jd-login i18n-text"
              href="javasctipt:;"
              clstag="Login|keycount|middleContentSec|uc-login"
            >手机号快速登录</span>
          </div>
        </div>
      </div>
    </div>


  </div>
</template>


<script>
export default {
  data() {
    return {
      addForm: {
        username: "",
        password: ""
      },
      loginFormRules: {
        username: [
          { required: true, message: "请输入您的用户名", trigger: "blur" },
          { min: 3, max: 18, message: "用户名长度在3-18之间", trigger: "blur" }
        ],
        password: [
          { required: true, message: "请输入您的密码", trigger: "blur" },
          {
            min: 3,
            max: 18,
            message: "密码长度在3-18之间",
            trigger: "blur"
          }
        ]
      }
    };
  },
  methods: {
    handleLogin() {
      this.$refs.loginFormRules.validate(async valid => {
        if (!valid) return false;
        let { data: res } = await this.$http.post("login", this.loginForm);

        if ((res.meta.status = 400)) {
          window.sessionStorage.removeItem("token");
          return this.$message.error(res.meta.msg);
        }
        if (res.meta.status == 200) {
          window.sessionStorage.setItem("token", res.data.token);
          this.$router.push("/home");
          return this.$message.suceess(res.meta.msg);
        }
      });
    }
  }
};
</script>

<style>
.column__container {
  position: relative;
  flex-grow: 1;
  display: flex;
  flex-direction: column;
}
.login-form {
  padding-top: 11vh;
  width: 340px;
  margin: 0 auto;
  position: relative;
}
.login-form__title {
  font-weight: 600;
  font-size: 24px;
  color: rgba(2, 18, 65, 0.75);
  padding-bottom: 40px;
}
.login-loading {
  display: block;
  box-sizing: border-box;
  width: 100%;
  border-radius: 4px;
  border-width: 1px;
  line-height: 45px;
  height: 45px;
  /* border: 2px solid #d3d8de; */
  border: 1px solid #a3b1bf;
  padding: 0 24px;
  font-size: 14px;
  color: #021241;
}
.login-form__group {
  position: relative;
  margin-bottom: 30px;
}
.login-form__submit {
  margin-top: 10px;
  width: 100%;
  height: 45px;
  line-height: 45px;
  padding: 0 10px;
  vertical-align: middle;
  text-align: center;
  background-image: linear-gradient(-237deg, #3171ff 0%, #429eec 100%);
  color: #fff;
  border: 0;
  font-size: 18px;
  cursor: pointer;
  border-radius: 4px;
}
.skip-btn {
  text-align: right;
  padding-top: 10px;
  padding-bottom: 30px;
}
.cl {
  zoom: 1;
}
.skip-btn .regis {
  float: left;
}
.skip-btn a {
  font-size: 14px;
  color: rgba(2, 18, 65, 0.75);
}
a {
  text-decoration: none;
}
.skip-btn .forpassword {
  float: right;
}
.boundaly-ul {
  text-align: center;
  list-style: none;
}
.boundary-ul .boundary-left {
  display: inline-block;
  background-image: linear-gradient(
    269deg,
    #d3d8de 0%,
    rgba(211, 216, 222, 0) 100%
  );
  width: 70px;
  height: 2px;
}
.boundary-ul .boundary-center {
  display: inline-block;
  font-family: PingFangSC;
  font-size: 14px;
  color: rgba(2, 18, 65, 0.75);
  letter-spacing: 0;
  margin-left: 10px;
  margin-right: 10px;
  margin-top: -10px;
}
.boundary-ul .boundary-right {
  display: inline-block;
  background-image: linear-gradient(
    269deg,
    rgba(211, 216, 222, 0) 0%,
    #d3d8de 100%
  );
  width: 70px;
  height: 2px;
}
.jd-accountpic {
  width: 75px;
  height: 45px;
  border-radius: 100%;
  margin-right: 10px;
  cursor: pointer;
  margin-top: -8px;
}
img {
  vertical-align: middle;
}
.jd-account {
  margin-top: 20px;
  text-align: center;
  width: 100%;
  position: relative;
}
.jd-account span {
  font-family: PingFangSC;
  font-size: 20px;
  color: rgba(2, 18, 65, 0.75);
  cursor: pointer;
  display: block;
  margin-top: 10px;
}

</style>