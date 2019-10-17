<template>
  <div class="register">
    <!-- 版心 -->
    <div class="container">
      <!-- 顶部导航 -->
      <div class="head">
        <div class="left_head">
          <a href>
            <img src="../../public/img/logo.png" class="logo" />
          </a>
          <h1 class="title">注册</h1>
        </div>
        <div class="right_head">
          <span>已有账号？</span>
          <a href>去登录</a>
        </div>
        <div class="switch">
          <span class="option">中文</span>
          /
          <span class="option">En</span>
        </div>
      </div>
      <!-- 主体部分 -->
      <!-- <div class="main">
        <div class="container">
          <div class="panel_head">
            <h2>欢迎注册京东云新账号</h2>
          </div>
          <div class="panel_body">
            <div class="form_main"></div>
          </div>
        </div>
      </div>-->
      <!-- <el-card shadow="never">
        <el-input placeholder="输入账号名" v-model="input4">
          <i slot="prefix" class="el-input__icon el-icon-user"></i>
        </el-input>
        <el-input placeholder="输入密码" v-model="input4" show-password>
          <i slot="prefix" class="el-input__icon el-icon-lock"></i>
        </el-input>
        <el-input placeholder="再次输入密码" v-model="input4" show-password>
          <i slot="prefix" class="el-input__icon el-icon-lock"></i>
        </el-input>
        <el-input placeholder="  输入常用手机号" v-model="input4">
          <i slot="prefix" class="el-input__icon el-icon-mobile-phone"></i>
        </el-input>
      </el-card>-->
      <el-card shadow="never">
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="80px">
          <el-form-item >
            <h1>欢迎注册京东云新账号</h1>
            <hr>
          </el-form-item>
          <el-form-item>
            <el-input placeholder="输入账号名" v-model="ruleForm.name">
              <i slot="prefix" class="el-input__icon el-icon-user"></i>
            </el-input>
          </el-form-item>

          <el-form-item>
            <el-input placeholder="输入密码" v-model="input4" show-password>
              <i slot="prefix" class="el-input__icon el-icon-lock"></i>
            </el-input>
          </el-form-item>
          <el-form-item>
            <el-input placeholder="再次输入密码" v-model="input4" show-password>
              <i slot="prefix" class="el-input__icon el-icon-lock"></i>
            </el-input>
          </el-form-item>
          <el-form-item>
            <el-input placeholder="  输入常用手机号" v-model="input4">
              <i slot="prefix" class="el-input__icon el-icon-mobile-phone"></i>
            </el-input>
          </el-form-item>
        </el-form>
      </el-card>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
  methods: {}
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

.register {
  background-color: #fff;
  /* background-color: #f4f4f4; */
}

.container {
  width: 1200px;
  margin: auto;
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
  margin: 20px 0 0 20px;
  color: #333;
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
  background: #fff;
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
.el-input{
  width: 350px;
  /* height: 40px; */
  margin-left: 365px;
}
h1{
  text-align: center;
  font-size: 30px;
  font-weight: 400;
  padding:0px 10px;
  margin-bottom: 18px;
}
</style>